# docassemble.ForeclosureSalePostponement

Foreclosure Sale Postponement

## Author

Minnesota Courts


## Development status

See [DEVELOPMENT.md](DEVELOPMENT.md) for setup and validation, and [IMPROVEMENTS.md](IMPROVEMENTS.md) for prioritized remaining work. These interviews are development drafts; passing static checks is not production acceptance.

Narrative acceptance scenarios: [TEST_SCENARIOS.md](TEST_SCENARIOS.md). Implementation rationale: [DECISIONS.md](DECISIONS.md).


## Isolated ALKiln environment

The isolated workflow preloads `docassemble.ALToolbox.ThreePartsDate` so the AssemblyLine baseline `BirthDate` field and its label parameters are registered before interview YAML is parsed. A YAML `modules` directive alone runs too late for this parser requirement. The workflow also installs the public pinned LawHelpMN branding assets and loads this repository’s PDF assertion steps.

Local representative E2E, wheel metadata/assets checks, and an exact baseline parser regression were verified. Final isolated validation after the startup-preload correction is awaiting resolution of the GitHub account billing/spending restriction; this draft does not claim that final head passes isolated CI.
