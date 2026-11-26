# Foreclosure Sale Postponement: prioritized review

Updated 2026-11-25 after merging PRs #5, #3, and #6. `[x]` means the stated work has been implemented or verified; `[ ]` means its stated acceptance is still pending. Technical implementation, legal approval, office acceptance, and usability are tracked separately.

See [TEST_RESULTS.md](TEST_RESULTS.md) for execution evidence, [TEST_SCENARIOS.md](TEST_SCENARIOS.md) for coverage, and [FORM_SOURCES.md](FORM_SOURCES.md) for substantive questions. Automated passes do not establish legal acceptance or LHI parity.

## Completed implementation and verification

- [x] Replace the obsolete output PDF with a labeled 2026 statutory DOCX adaptation and separate printable instructions. Template labels are inventoried. Approval of the adaptation remains open below.
- [x] Implement the current supported-route gates and help screens for property/owner eligibility, proceeding date, prior owner postponement, publication, and the redemption election.
- [x] Give users who do not know the recording date a source-finding help screen; the `unknown_recording_date` browser scenario passes. Improving real-world recovery from uncertainty remains part of scope and user research.
- [x] Recompute filing dates after sale-date edits and use the Minnesota business-day calendar for planning. The `sale_date_review` browser scenario reaches urgent help after an edit to within 14 days. Legal counting rules remain open below.
- [x] Remove purported electronic-notary collection and preserve manual execution fields. Require an explicit choice about the five-week redemption tradeoff.
- [x] Link the matching LawHelpMN resource in metadata, the introduction, downloads, and instructions, and include the shared branding theme.
- [x] Fix the branding dependency, deadline-test dependencies/context, and namespace compatibility in [PR #5](https://github.com/LemmaLegalConsulting/docassemble-ForeclosureSalePostponement/pull/5).
- [x] Make the recordable affidavit text explicitly black, remove its colored rule, and add a formatting regression check in PR #5. Source checks and downloaded PDF inspection passed.
- [x] Repair isolated Docker startup/readiness and run the current browser/PDF suite in [PR #3](https://github.com/LemmaLegalConsulting/docassemble-ForeclosureSalePostponement/pull/3): 17 scenarios and 97 steps passed. This replaces the old October-only verification gap for the covered scenarios.
- [x] Run all five unit tests and static validation on GitHub: zero static errors or warnings, with four informational findings. See TEST_RESULTS.md for run links.
- [x] Prevent interrupted reports from being loaded as Cucumber configuration in [PR #6](https://github.com/LemmaLegalConsulting/docassemble-ForeclosureSalePostponement/pull/6). Local Docker clean, repeated, interrupted, empty-file, and truncated-file cases were verified; PR checks passed.
- [x] Prepare a local counsel review packet with nine decision items and nineteen proposed acceptance cases tied to screens, templates, and tests. It remains in ignored `env/`; preparation does not close any counsel decision.

## Remaining priorities

These are the unfinished portions of the original seven review areas. A passing implementation test does not check off a broader legal or operational decision.

- [ ] **P0 — Approve the replacement statutory affidavit.** Counsel must approve the adaptation, proceeding-date applicability and combined amendments, notice attachments/legal descriptions, and execution arrangements. Recording officials must review complete sample packets and layout. Close with approved wording/form version and documented acceptance for the supported route. The comparison Commerce blank still prints 2011; this adaptation is not represented as a newly issued numbered UCB form.

- [ ] **P0 — Approve deadline and delivery instructions.** Resolve sections 645.15 and 645.151 separately for recording, sheriff filing, and attorney delivery, including what constitutes timely completion. Approve the cutoff/help wording and independent boundary examples; the existing categorical no-extension assertion remains unresolved. Distinguish planning dates from legally permissible completion dates. Decide whether to continue leaving the actual postponed sale date to confirmation rather than calculating it.

- [ ] **P1 — Approve supported scope or extend excluded routes.** Decide whether older proceedings, estates, heirs, other representatives, and uncertain facts remain outside the product or receive additional reviewed forms/logic. Approve useful help and source-finding routes for each exclusion. Implement expansion only if selected; an approved, clearly explained scope limit can close that decision without supporting every possible user.

- [ ] **P1 — Validate the complete real-world workflow with counselors and offices.** Review authorized redacted notices and complete affidavit packets, Abstract/Torrens and multicounty routing, fees, delivery methods, recorded-copy turnaround, recipients, receipts, and sale-date confirmation. Observe intended users completing the steps and explaining the redemption tradeoff and that downloading does not file anything. Synthetic downloads do not establish office acceptance or user success.

- [ ] **P2 — Complete publication and accessibility acceptance.** Review legal-help wording, provider links, branding presentation, language/translation needs, mobile and keyboard use, screen-reader behavior, and PDF reading order with appropriate reviewers. Working dependencies, linked help, and tagged PDFs cover parts of implementation; the broader acceptance remains pending. Keep testing/unlisted metadata until release is authorized.

- [ ] **P1 — Establish redemption and signer facts.** Counsel must approve collection of the statutory redemption category, unknown/exceptional routes, each added signer's required facts, shared versus separate notarial appearances, and the plain-language redemption definition. Close by implementing the approved questions/form changes and independently approved acceptance cases. Names/signature-count tests do not establish who must sign.

- [ ] **P1 — Finish uncovered edit, resume, and document-validation cases.** Current baseline execution is complete above. Remaining checks include edits to owners, county, proceeding date, publication and election; previously saved/downloaded forms; next-day resume across Minnesota midnight; and help recovery beyond the covered scenarios. Obtain a documented compatible dependency set or disposition of the known server dependency-metadata warnings. Turn approved counsel/office decisions into expected outcomes before treating complete packets and recording/delivery procedures as verified.

## Next action and closure rule

Review the local counsel packet, obtain answers for the deadline, affidavit, redemption, and signer questions, then implement the approved decisions and acceptance cases. Office confirmation and counselor/user observations have their own owners and evidence.

Check off each remaining item only when its stated acceptance is recorded in the relevant source, decision, or test documentation. Split partially completed work into a completed checkbox and a concrete pending checkbox instead of leaving an outdated broad task unchanged.
