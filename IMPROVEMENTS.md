# Foreclosure Sale Postponement: prioritized review

Updated 2026-11-13 after the evidence audit and focused technical repairs. See [TEST_SCENARIOS.md](TEST_SCENARIOS.md), [DECISIONS.md](DECISIONS.md), and [TEST_RESULTS.md](TEST_RESULTS.md). Automated passes do not establish legal acceptance or LHI parity.

## Implemented

Replaced the obsolete output PDF with a labeled 2026 statutory DOCX, separated instructions, removed contradictory deadline code and electronic-notary collection, added eligibility/applicability help screens, explicit redemption choice, and recalculation after edits. Matching LawHelpMN help is linked in metadata, introduction, downloads, and printable instructions. Template labels are inventoried.

The November 13 technical repairs declare the verified branding fork, supply the real deadline-test dependencies, update namespace compatibility, and make the affidavit's text explicitly black. They do not change legal screening or deadline behavior.

## Remaining priorities

1. **P0 — Approve the replacement statutory affidavit.** Review the Lemma adaptation of the 2026 affidavit, its recording layout, signatures, and combined effect of chapters 51 and 88. The linked Commerce-style blank still prints 2011; this is not represented as a newly issued numbered UCB form. See FORM_SOURCES.md.

2. **P0 — Approve deadline and delivery instructions.** The code subtracts 15 calendar days and uses ALToolbox’s Minnesota calendar to recommend the last business day on or before that cutoff. The existing no-extension assertion is unresolved legal content: counsel must reconcile sections 645.15 and 645.151 for each recording, sheriff-filing, and attorney-delivery duty. Confirm office closures, publication/postponement notices, recording in every applicable office, and delivery requirements. The interview intentionally does not calculate the postponed sale date yet.

3. **P1 — Support earlier proceedings and representatives.** Proceedings with pre-April-22-2026 recording dates, estates, and heirs currently receive useful help screens. Decide the additional supported workflows and forms. An unknown recording date also needs a more helpful supported path.

4. **P1 — Review real-world use with counselors.** Test actual notices, multiple property counties, multiple owners, changed sale dates, and office-specific instructions. Confirm users understand the five-week redemption tradeoff and that downloading does not file anything.

5. **P2 — Publication and accessibility review.** Confirm provider links, branding, legal-help wording, translations, mobile/keyboard usability, and accessible PDF reading order. Keep testing/unlisted metadata until approved.

6. **P1 — Establish redemption and signer facts.** The interview explains six- and twelve-month alternatives but does not collect the statutory redemption category. Added owners supply names without separate eligibility facts, and the affidavit has a shared jurat. Counsel must approve screening, unknown routes, execution arrangements, and the plain-language definition of redemption before these are changed.

7. **P1 — Validate the current installed build.** Rerun live browser scenarios after the technical repairs, including changed answers, stale downloads, next-day resume, and help recovery. The October browser summary does not verify the current source, dependencies, or production converter. Validate complete redacted packets and local recording/delivery procedures.
