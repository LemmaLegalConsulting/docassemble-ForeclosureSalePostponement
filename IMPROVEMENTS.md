# Foreclosure Sale Postponement: prioritized review

Updated 2026-10-04 after implementation and local testing. See [TEST_SCENARIOS.md](TEST_SCENARIOS.md), [DECISIONS.md](DECISIONS.md), and saved `validation/` reports. Automated passes do not establish legal acceptance or LHI parity.

## Implemented

Replaced the obsolete output PDF with a labeled 2026 statutory DOCX, separated instructions, removed contradictory deadline code and electronic-notary collection, added eligibility/applicability help screens, explicit redemption choice, and recalculation after edits. Matching LawHelpMN help is linked in metadata, introduction, downloads, and printable instructions. Template labels are inventoried.

## Remaining priorities

1. **P0 — Approve the replacement statutory affidavit.** Review the Lemma adaptation of the 2026 affidavit, its recording layout, signatures, and combined effect of chapters 51 and 88. The linked Commerce-style blank still prints 2011; this is not represented as a newly issued numbered UCB form. See FORM_SOURCES.md.

2. **P0 — Approve deadline and delivery instructions.** The code subtracts 15 calendar days and does not automatically extend the filing cutoff for weekends or holidays. Confirm legal counting, office closures, publication/postponement notices, recording in every applicable office, and delivery requirements. The interview intentionally does not calculate the postponed sale date yet.

3. **P1 — Support earlier proceedings and representatives.** Proceedings with pre-April-22-2026 recording dates, estates, and heirs currently receive useful help screens. Decide the additional supported workflows and forms. An unknown recording date also needs a more helpful supported path.

4. **P1 — Review real-world use with counselors.** Test actual notices, multiple property counties, multiple owners, changed sale dates, and office-specific instructions. Confirm users understand the five-week redemption tradeoff and that downloading does not file anything.

5. **P2 — Publication and accessibility review.** Confirm provider links, branding, legal-help wording, translations, mobile/keyboard usability, and accessible PDF reading order. Keep testing/unlisted metadata until approved.
