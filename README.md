# docassemble.ForeclosureSalePostponement

Foreclosure Sale Postponement

## Author

Minnesota Courts


## Development status

See [DEVELOPMENT.md](DEVELOPMENT.md) for setup and validation, and [IMPROVEMENTS.md](IMPROVEMENTS.md) for prioritized remaining work. These interviews are development drafts; passing static checks is not production acceptance.

Narrative acceptance scenarios: [TEST_SCENARIOS.md](TEST_SCENARIOS.md). Implementation rationale: [DECISIONS.md](DECISIONS.md).


## Isolated ALKiln environment

The isolated workflow preloads `docassemble.ALToolbox.ThreePartsDate` so AssemblyLine’s baseline `BirthDate` field parameters are registered before interview YAML is parsed. After package installation, the job restarts the verified `uwsgi` supervisor service in ALKiln’s `docassemble_container` and waits up to 180 seconds for HTTP readiness. This lets startup imports see the newly installed dependency. The workflow also installs pinned public LawHelpMN branding assets and loads this repository’s PDF assertion steps.

Local representative E2E, wheel metadata/assets checks, and an exact baseline parser regression were verified. Startup preloading alone still failed in isolated CI; the subsequent explicit restart and readiness correction is not yet isolated-validated. This public repository is distinct from the private repositories affected by GitHub account billing restrictions. See the PR and workflow reports for current results; no final isolated success is claimed here.
