# Verified local test baseline

## Docker verification on November 24 2026

An integration snapshot combining this technical foundation with PR #3's E2E changes passed **17 ALKiln scenarios and 97 test steps** using the CI Docker entrypoint, including the representative fixture from PR #3 and all 16 existing regression scenarios. The JSON also contains 34 hidden lifecycle-hook entries; those are not additional test steps. Tests exercised actual form downloads and the repository's PDF assertions. No scenario or assertion was disabled. See [the sanitized execution summary](validation/alkiln-results-2026-11-24.json). Raw reports and generated synthetic documents remain in ignored `env/e2e-20261124/` and `.alkiln-artifacts/ci/`.

All **5 unit tests passed** against the interview server's runtime, in a clean Linux virtual environment installed from `requirements-dev.txt` (including Docassemble base 1.10.15), and with Python 3.12 on Windows. The standalone deadline fixture now supplies a real Docassemble global context, an empty server-configuration hook, English language, and an explicit America/Chicago timezone. Calendar and date functions are not mocked, and expected deadline values were not changed.

The pinned static checker reports **0 errors, 0 warnings, and 4 informational findings** over the application and tests. A downloaded two-page affidavit was rendered and visually inspected; it retains the recording space, signing blanks, and owner/preparer data, with no nonblack RGB operators in either page.

PR #3's last remote E2E run failed during its worker-restart/readiness step before Cucumber ran. The separate validation job failed importing PyYAML. The replacement Docker entrypoint maintained in PR #3 installs the interview package before starting any web worker, preloads the required BirthDate datatype module, and waits for `/health_check?ready=1`. PR #3 uses that entrypoint locally and in its `.github/workflows/alkiln.yml`; the technical-fixes PR keeps the dependency, formatting, and unit-test foundation separate. Local passes do not mean the old GitHub run has become green; the updated branch must be pushed and its workflows run before remote acceptance.

The audit remains under ignored `env/`. Substantive release questions remain tracked in [FORM_SOURCES.md](FORM_SOURCES.md) and [IMPROVEMENTS.md](IMPROVEMENTS.md). These tests establish technical behavior, not legal approval or production readiness.

## Historical October baseline

On October 4, 2026, all **15 scenarios and 85 story steps passed** against the installed localhost package. See [the sanitized execution report](validation/alkiln-results.json) for names, source revision, hashes, and artifact location. Fixtures include generated-PDF assertions and review edits. Browser screenshots and synthetic downloads remain locally in the ignored artifact folder.

DAYamlChecker default and style checks report **zero errors**. Remaining warnings and informational findings are preserved in `validation/dayamlchecker*.txt`. Template regression tests passed; the current template inventory and rendered-output checks are saved in `validation/template-labels.json` and `validation/template-verification.json`.

Earlier exploratory failures are retained locally. They identified application defects (including Name Change county gathering and the extra-spouse loop) and test-harness incompatibilities with the installed Docassemble version. The checked-in harness documents its checkbox, button, navigation, and read-only DOM-query compatibility fixes. No failed assertion is converted to a pass. A foreclosure navigation race was reproduced and rerun before the final complete suite passed.

The Name Change full run predates the final read-only DOM-query retry; its story fixtures and application were unchanged. Health Care Directive and foreclosure full runs include that retry. The retry only handles a browser execution context disappearing during navigation.

This is a development baseline, not client legal acceptance, live LHI parity, complete accessibility testing, or production deployment. Prioritized remaining work is in [IMPROVEMENTS.md](IMPROVEMENTS.md).
