"""Run working-tree E2E tests in the same disposable Docker setup as CI.

Only Python and Docker are required on the host. Generated credentials stay
under ignored .alkiln-artifacts/docker; uploaded reports contain no credentials.
"""
from pathlib import Path
import argparse
import hashlib
import json
import os
import secrets
import shutil
import subprocess
import time
import urllib.error
import urllib.request

ROOT = Path(__file__).resolve().parents[1]


def run(*args, **kwargs):
    return subprocess.run(args, cwd=ROOT, check=True, **kwargs)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--port', type=int, default=8091)
    parser.add_argument('--keep-server', action='store_true')
    parser.add_argument('--tags', default=os.environ.get('ALKILN_TAG_EXPRESSION', ''))
    args = parser.parse_args()
    suffix = secrets.token_hex(4)
    server, browser = 'foreclosure-server-' + suffix, 'foreclosure-browser-' + suffix
    network = 'foreclosure-e2e-' + suffix
    private = ROOT / '.alkiln-artifacts' / 'docker' / suffix
    artifacts = ROOT / '.alkiln-artifacts' / 'ci'
    source = private / 'source'
    source.mkdir(parents=True)
    artifacts.mkdir(parents=True, exist_ok=True)
    names = subprocess.check_output(
        ['git', 'ls-files', '--cached', '--others', '--exclude-standard'],
        cwd=ROOT, text=True,
    ).splitlines()
    hashes = {}
    for name in names:
        path = ROOT / name
        if path.is_file():
            dest = source / name
            dest.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(path, dest)
            hashes[name] = hashlib.sha256(path.read_bytes()).hexdigest()
    api_key, password = secrets.token_hex(16), secrets.token_hex(20)
    config = private / 'config'
    config.mkdir()
    (config / 'config.yml').write_text(
        'debug: true\ntimezone: America/Chicago\npreloaded modules:\n'
        '  - docassemble.ALToolbox.ThreePartsDate\n', encoding='utf-8',
    )
    server_env = private / 'server.env'
    server_env.write_text('\n'.join([
        'DA_ADMIN_EMAIL=admin@example.com', 'DA_ADMIN_PASSWORD=' + password,
        'DA_ADMIN_API_KEY=' + api_key,
        'DA_CONFIG=/tmp/foreclosure-config/config.yml',
    ]) + '\n', encoding='utf-8')
    browser_env = private / 'browser.env'
    branch = (os.environ.get('GITHUB_HEAD_REF') or os.environ.get('GITHUB_REF_NAME')
              or subprocess.check_output(['git', 'branch', '--show-current'], cwd=ROOT, text=True).strip()
              or 'local-working-tree')
    browser_env.write_text('\n'.join([
        'SERVER_URL=http://server', 'DOCASSEMBLE_DEVELOPER_API_KEY=' + api_key,
        'REPO_URL=https://github.com/LemmaLegalConsulting/docassemble-ForeclosureSalePostponement',
        'BRANCH_NAME=' + branch,
        'ALKILN_TAG_EXPRESSION=' + args.tags, '_ORIGIN=github',
    ]) + '\n', encoding='utf-8')
    result, server_started, network_created = 1, False, False
    try:
        print('Building the server with packages installed before startup.', flush=True)
        run('docker', 'build', '-f', 'tests/Dockerfile.docassemble', '-t', server, str(source))
        print('Building the pinned ALKiln browser runner.', flush=True)
        run('docker', 'build', '-f', 'tests/Dockerfile.alkiln', '-t', browser, str(source))
        run('docker', 'network', 'create', network)
        network_created = True
        run('docker', 'run', '-d', '--name', server, '--network', network,
            '--network-alias', 'server', '--memory', '3g', '--env-file', str(server_env),
            '--mount', f'type=bind,source={config},target=/tmp/foreclosure-config',
            '-p', f'127.0.0.1:{args.port}:80', server)
        server_started = True
        deadline, url = time.monotonic() + 600, f'http://127.0.0.1:{args.port}'
        while True:
            try:
                with urllib.request.urlopen(url + '/health_check?ready=1', timeout=5) as response:
                    if response.status == 200:
                        break
            except (OSError, urllib.error.URLError):
                pass
            if time.monotonic() >= deadline:
                raise TimeoutError('Docassemble readiness check exceeded 600 seconds')
            time.sleep(2)
        print('Server ready. Running selected features and PDF assertions.', flush=True)
        completed = subprocess.run([
            'docker', 'run', '--rm', '--name', browser, '--network', network,
            '--memory', '1g', '--env-file', str(browser_env),
            '--mount', f'type=bind,source={artifacts},target=/workspace/.alkiln-artifacts/ci',
            browser,
        ], cwd=ROOT)
        result = completed.returncode
    finally:
        if server_started and result:
            logs = subprocess.run(['docker', 'logs', server], cwd=ROOT, capture_output=True, text=True)
            text = (logs.stdout + logs.stderr).replace(api_key, '[redacted]').replace(password, '[redacted]')
            (artifacts / 'server-startup.log').write_text(text, encoding='utf-8')
        metadata = dict(source_sha256=hashes, tags=args.tags, exit_code=result,
                        server_image='jhpyle/docassemble@sha256:c0b0a707a6cd2149d5777ee83af1ea1de544210e597371eac93e67a1503c395c',
                        alkiln='5.17.1', timezone='America/Chicago')
        (artifacts / 'run-metadata.json').write_text(json.dumps(metadata, indent=2), encoding='utf-8')
        # These random names belong only to this invocation, never other servers.
        subprocess.run(['docker', 'rm', '-f', browser], cwd=ROOT, capture_output=True)
        if server_started and args.keep_server:
            print(f'Test server retained at http://127.0.0.1:{args.port}; container {server}', flush=True)
        else:
            subprocess.run(['docker', 'rm', '-f', server], cwd=ROOT, capture_output=True)
            if network_created:
                run('docker', 'network', 'rm', network)
    return result


if __name__ == '__main__':
    raise SystemExit(main())
