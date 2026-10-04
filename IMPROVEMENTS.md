# Foreclosure Sale Postponement: prioritized improvements

Reviewed 2026-10-04. Static source/template review only. Deadline defects below are code findings, not an endorsement of a legal calculation rule. Have the client approve the applicable rule and worked examples before implementing it. No completed browser interview has been verified. Synthetic template rendering is recorded in `validation/template-verification.json`.

## P0 — complete before a pilot release

1. **Rebuild the deadline data model and routing.** In `data/questions/foreclosure_sale_postponement.yml`, `actual_deadline` subtracts 15 days from `sale_date`, then `deadline_passed` subtracts another 15 days and is compared to `True`. `deadline_date` is a continue-button boolean but the PDF mapping calls `.format()` on it. A separate screen calls `sale_date()` and adds 15 days. Use distinct variables for the actual date, a boolean lateness check, and screen completion. Confirm the legal cutoff, holiday adjustment direction/calendar, timezone, and reference date with Amanda. Test day before/on/after cutoff, weekends, holidays, year boundaries, leap years, and changed sale dates.
2. **Restore a complete executable interview order.** The mandatory block references `interview_order_foreclosure_sale_postponement` without a local definition. `else_deadline_date`, `deadline_date_actual`, and `deadline_date_possible` are referenced in review/output without local definitions. Define the required collection and output values; remove obsolete paths after agreeing the intended workflow.
3. **Make eligibility and prior-postponement branches work.** The ineligible screen has no event/continue target, while the main order exits directly. `previous_postponement` is asked without a subsequent eligibility decision. Use explicit answers and readable stop screens with client-approved referrals. Verify the types of the unquoted Yes/No choices and their string comparisons on Docassemble.
4. **Repair and verify document output.** Audit every PDF field against the final data model. The setup pass repaired the next-steps DOCX’s `{_{ ... }}` delimiters, added PDF tooltips, and removed duplicate YAML mappings for the shared owner field. Replace “XYZ” and the unfinished instruction text. The PDF itself prints both late and timely deadline notices and a possible-holiday notice unconditionally; blanking fields does not hide those contradictory paragraphs. Decide whether to replace its instruction pages with a conditional DOCX. The on-screen instructions also refer to Word editing although the main form is a PDF, and office addresses are not interpolated into the shown instructions. Obtain current client-approved filing/delivery instructions and fees.
5. **Verify branding on the target server.** Restored the referenced `MNfavicon-96x96.png` from Amanda’s HCD package; confirm its appearance in the deployed theme.

## P1 — functional and document QA

6. Reconcile `owner_name_*`, `owner`, `users`, and `drafter`; eliminate duplicate collection and map each person to the correct form fields. The same `he_is_she_is_they_are` variable is used for gender and pronoun wording; separate or derive only what the form needs.
7. Agree how signing and notarization will work. The interview requests user and notarial-officer signatures; validate whether that matches the intended real-world process before enabling electronic collection.
8. Add branch-aware review/edit and ensure editing `sale_date` updates every deadline display and output without stale values. Preserve useful answers when returning from an ineligible path.

## P2 — polish

9. Resolve duplicate County labels and vague choices; simplify instructions and explain Torrens terminology. Review whether gender collection is needed.
10. Fix DOCX headings/footer reading order and document metadata; test keyboard/mobile use and output accessibility.

## Acceptance scenarios for the next development phase

- Eligible/ineligible property; prior postponement yes/no; within/on/past the approved deadline.
- Client-approved weekend/holiday and boundary-date fixtures, including edits after calculation.
- Distinct owner/drafter identities; complete address and document fields; downloadable form and approved instructions.

