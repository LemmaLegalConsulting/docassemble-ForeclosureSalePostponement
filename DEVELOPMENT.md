# Development setup

Working repo: https://github.com/LemmaLegalConsulting/docassemble-ForeclosureSalePostponement
Original (`upstream`): https://github.com/AmandaSauber/docassemble-ForeclosureSalePostponement
The original local baseline used branch `setup/validation-and-review` and `http://localhost`. Use the isolated Docker runner below to test the current working tree without changing an existing server. No public deployment is performed by these checks.

## Static and template checks

```sh
uv venv .venv
uv pip install --python .venv/bin/python -r requirements-dev.txt
.venv/bin/dayamlchecker --style .
.venv/bin/python -m unittest discover -s tests -p 'test_*.py'
```

DAYamlChecker is pinned to source commit `5676a949ebca269325eb0d8bf0abad52eda4aa61` (source version 1.7.0). URL and accessibility checks stay enabled. Errors fail CI; warnings remain review work. GitHub Actions also runs template regression tests. Use `uv run --no-project --with-requirements requirements-dev.txt ...` if running tools without installing this interview's runtime dependencies.

`requirements-dev.txt` also pins PyYAML, ALToolbox, and Docassemble base for the deadline tests. Those tests use the actual runtime date and business-day helpers. They verify the current calculation and printable output, not the unresolved legal counting rules in [FORM_SOURCES.md](FORM_SOURCES.md).

Docassemble imports `pyzbar` even for these date tests. On Ubuntu 24.04, install its native library before running the suite:

```sh
sudo apt-get update
sudo apt-get install -y --no-install-recommends libzbar0t64
export NLTK_DATA="$PWD/.venv/nltk_data"
python -c 'import nltk, os; [nltk.download(name, download_dir=os.environ["NLTK_DATA"], raise_on_error=True) for name in ("omw-1.4", "wordnet", "wordnet_ic", "sentiwordnet")]'
python -c 'import os, pathlib, zipfile; p = pathlib.Path(os.environ["NLTK_DATA"]) / "corpora"; zipfile.ZipFile(p / "wordnet.zip").extractall(p)'
```

CI uses Ubuntu 24.04 and installs the native library and language data explicitly. On Windows, pyzbar's bundled DLLs require the matching Visual C++ 2013 runtime; see [Microsoft's runtime downloads](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist/). The November 13 local run used DLLs extracted from Microsoft's signed bundle into ignored `env/technical-fixes/`, with a process-local DLL search path; it did not install a system runtime or mock Docassemble.

The interview requires the LemmaLegalConsulting branding fork. Both package metadata declarations pin revision `f6b5c1a750ee4618a1182682fd42cb98e85b3670` (version 0.0.2), which supplies `theme.yml` and its assets.

## Run the interview locally

```sh
/home/quinten/venv/bin/dainstall --server localhost .
```

Open `http://localhost/interview?i=docassemble.ForeclosureSalePostponement:data/questions/foreclosure_sale_postponement.yml&new_session=1`.
Installing a package may restart the server; finish installations before starting browser suites. Use only synthetic test data.

## ALKiln story tables

### Isolated Docker run used by CI

With Docker Desktop running Linux containers, run this from the repository root:

```sh
python tests/run_docker_e2e.py
# Optional: leave the disposable server available for a browser walkthrough.
python tests/run_docker_e2e.py --port 8091 --keep-server
# Optional representative smoke test; the default runs every feature.
python tests/run_docker_e2e.py --tags @e2e
```

This needs only Python, Git, and Docker on the host. It builds from tracked and unignored working-tree files, including uncommitted changes. Ignored `env/` audit material is excluded. The server and browser images are pinned by digest; ALKiln is pinned to 5.17.1. Chromium and Poppler run in a separate test container.

The interview package and dependencies are installed while building the server image, before web workers start. The isolated config preloads `docassemble.ALToolbox.ThreePartsDate`, then readiness is checked at `/health_check?ready=1`. This replaces PR #3's asynchronous API install followed by a worker restart and root-page polling. It keeps the verified Lemma branding fork, so the older PR's duplicate local theme wrapper is unnecessary.

The runner uses unique container/network names and binds the demo only to localhost. By default it removes its containers and network after testing; `--keep-server` prints the retained server's name and URL. It does not stop or alter existing Docassemble containers. Raw reports and downloads go to ignored `.alkiln-artifacts/ci/`. Disposable configuration and credentials go to `.alkiln-artifacts/docker/` and are excluded from the CI artifact upload. Source hashes and the exit code are retained in `run-metadata.json`.

Both browser runners explicitly select `tests/cucumber.cjs` and write JSON results as
`cucumber-results.json`. Cucumber otherwise discovers `cucumber.json` as configuration;
an empty or truncated report left by an interruption can then prevent startup. The
explicit configuration also lets reruns tolerate old `cucumber.json` artifacts without
deleting them. A partial report remains evidence of an incomplete run until a new run
finishes successfully; use the matching console output, summary, and exit code.

### Existing installed-server runner

Fixtures: `docassemble/ForeclosureSalePostponement/data/sources/scenarios.feature`.
Narratives and expected behavior: [TEST_SCENARIOS.md](TEST_SCENARIOS.md).

```sh
# Requires a checkout of ALKiln with its npm dependencies and Chromium installed.
# Defaults to ~/ALKiln; override ALKILN_PATH if needed.
.venv/bin/python tests/run_alkiln.py .
# Optional second argument is a Cucumber tag expression.
```

The runner uses the `localhost` entry in `~/.docassemblecli`, without printing or storing its key in tracked files. Install the package first. It tests the installed package rather than uploading a Playground. Reports, screenshots, and synthetic downloads go to ignored `.alkiln-artifacts/`. It requires Node, Chromium/Puppeteer, PyYAML, and `pdftotext` (Poppler).

Tested ALKiln checkout: `d7e4f42aa8a828013a8a229067697decf1322e5f`. `tests/steps.cjs` contains PDF assertions and narrow compatibility fixes for current Docassemble: button containers are divs, checkbox state is read from the native input, and Resume may change the question without changing the URL. Read-only error queries retry briefly if navigation replaces the DOM; input actions and assertion failures are never ignored. It also stops promptly on AssemblyLine's custom error screen. These are test-harness changes, not suppressed application failures. Reassess them when upgrading ALKiln.

## Template audit and decisions

`validation/template-labels.json` records the current labels and control tags. `validation/template-verification.json` records strict synthetic rendering and PDF checks. The workspace scripts `audit_current_templates.py` and `verify_templates.py` refresh them. Early one-time migration scripts are historical and should not be rerun against the edited templates.

Keep wet signatures, initials, execution dates, and witness/notarial attestations manual. Record substantive choices and sources in [DECISIONS.md](DECISIONS.md); keep the remaining release decisions in [IMPROVEMENTS.md](IMPROVEMENTS.md).
