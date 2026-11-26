# Verification results

## Merged technical fixes and GitHub verification on November 25 2026

PRs [#5](https://github.com/LemmaLegalConsulting/docassemble-ForeclosureSalePostponement/pull/5), [#3](https://github.com/LemmaLegalConsulting/docassemble-ForeclosureSalePostponement/pull/3), and [#6](https://github.com/LemmaLegalConsulting/docassemble-ForeclosureSalePostponement/pull/6) are merged. The PR #6 head `062b87d822a64eaec0ed8f45a4208b0b294752d6` passed all three GitHub checks: push validation, PR validation, and E2E.

- [GitHub E2E run](https://github.com/LemmaLegalConsulting/docassemble-ForeclosureSalePostponement/actions/runs/45703421108): **17 scenarios and 97 steps passed**, including actual PDF downloads and assertions.
- [GitHub PR validation run](https://github.com/LemmaLegalConsulting/docassemble-ForeclosureSalePostponement/actions/runs/45703420892): **all five unit tests passed**, with **0 static errors, 0 warnings, and 4 informational findings**.
- [GitHub push validation run](https://github.com/LemmaLegalConsulting/docassemble-ForeclosureSalePostponement/actions/runs/45703375772): passed.

Local Docker verification also reproduced the pre-fix empty-JSON failure, passed the full suite, repeated a successful run, and killed an active Chromium run with SIGKILL (exit 137), preserving its actual zero-byte report. Recovery with that output and an empty legacy report passed; recovery with truncated legacy and current reports also passed. Each targeted successful browser rerun completed one scenario and eight steps, including a PDF download/assertions. Legacy report bytes remained unchanged. The installed-server runner's repository-relative configuration and support steps passed a Docker dry-run; its separate host credential setup was not exercised.

Raw interruption/recovery evidence remains under ignored `env/alkiln-reruns/2026-11-25/`. The local counsel packet remains under ignored `env/counsel-review/2026-11-25/`; its nine decision items and nineteen proposed cases remain open for substantive review. These passes do not verify every edit/resume path, actual recording/delivery, legal approval, complete dependency compatibility, or comprehensive accessibility. See the completed and pending checkboxes in [IMPROVEMENTS.md](IMPROVEMENTS.md).

## Docker verification on November 24 2026

An integration snapshot combining this technical foundation with PR #3's E2E changes passed **17 ALKiln scenarios and 97 test steps** using the CI Docker entrypoint, including the representative fixture from PR #3 and all 16 existing regression scenarios. The JSON also contains 34 hidden lifecycle-hook entries; those are not additional test steps. Tests exercised actual form downloads and the repository's PDF assertions. No scenario or assertion was disabled. See [the sanitized execution summary](validation/alkiln-results-2026-11-24.json). Raw reports and generated synthetic documents remain in ignored `env/e2e-20261124/` and `.alkiln-artifacts/ci/`.

All **5 unit tests passed** against the interview server's runtime, in a clean Linux virtual environment installed from `requirements-dev.txt` (including Docassemble base 1.10.15), and with Python 3.12 on Windows. The standalone deadline fixture now supplies a real Docassemble global context, an empty server-configuration hook, English language, and an explicit America/Chicago timezone. Calendar and date functions are not mocked, and expected deadline values were not changed.

The pinned static checker reports **0 errors, 0 warnings, and 4 informational findings** over the application and tests. A downloaded two-page affidavit was rendered and visually inspected; it retains the recording space, signing blanks, and owner/preparer data, with no nonblack RGB operators in either page.

At this November 24 snapshot, PR #3's earlier remote E2E run had failed during worker-restart/readiness before Cucumber ran, and validation had failed importing PyYAML. Those historical failures were subsequently addressed by PRs #3 and #5. The merged Docker entrypoint installs the interview package before starting web workers, preloads the BirthDate datatype module, and waits for `/health_check?ready=1`. The November 25 GitHub results above supersede the earlier pending-remote-acceptance status.

The audit remains under ignored `env/`. Substantive release questions remain tracked in [FORM_SOURCES.md](FORM_SOURCES.md) and [IMPROVEMENTS.md](IMPROVEMENTS.md). These tests establish technical behavior, not legal approval or production readiness.

## Historical October baseline

On October 4, 2026, all **15 scenarios and 85 story steps passed** against the installed localhost package. See [the sanitized execution report](validation/alkiln-results.json) for names, source revision, hashes, and artifact location. Fixtures include generated-PDF assertions and review edits. Browser screenshots and synthetic downloads remain locally in the ignored artifact folder.

DAYamlChecker default and style checks report **zero errors**. Remaining warnings and informational findings are preserved in `validation/dayamlchecker*.txt`. Template regression tests passed; the current template inventory and rendered-output checks are saved in `validation/template-labels.json` and `validation/template-verification.json`.

Earlier exploratory failures are retained locally. They identified application defects (including Name Change county gathering and the extra-spouse loop) and test-harness incompatibilities with the installed Docassemble version. The checked-in harness documents its checkbox, button, navigation, and read-only DOM-query compatibility fixes. No failed assertion is converted to a pass. A foreclosure navigation race was reproduced and rerun before the final complete suite passed.

The Name Change full run predates the final read-only DOM-query retry; its story fixtures and application were unchanged. Health Care Directive and foreclosure full runs include that retry. The retry only handles a browser execution context disappearing during navigation.

This is a development baseline, not client legal acceptance, live LHI parity, complete accessibility testing, or production deployment. Prioritized remaining work is in [IMPROVEMENTS.md](IMPROVEMENTS.md).
