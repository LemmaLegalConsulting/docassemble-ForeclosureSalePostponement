# Implementation decisions

## Working conventions — 2026-10-04

- **Prioritize implementation over estimating remaining agent time.** Quinten wants most human hours reserved for feedback and iteration. Keep unresolved choices visible, but make ordinary development decisions without repeatedly seeking confirmation.
- **Use focused commits.** Separate template repair, interview behavior, document content, and infrastructure where they can be reviewed and tested independently. The initial setup commit established the repositories, validator, and review baseline; subsequent commits should have narrower subjects.
- **Use the Assembly Line style guide as the default.** Favor sentence case, short active instructions, related fields grouped into small screens, conditional follow-ups, and useful offramps. Treat lint output as review evidence, not authority to change substantive legal language.
- **Preserve proven interfaces.** Keep unique PDF field names and their suffixes. Preserve legitimate radio groups and repeated appearances of the same field; repair only incorrect links or mappings.
- **Separate evidence levels.** Static checks, synthetic template renders, browser walkthroughs, and client content approval answer different questions. Do not call any one of them production acceptance.

## References consulted

- [Assembly Line style guide](https://assemblyline.suffolklitlab.org/docs/style_guide/): local `~/AssemblyLine-docs/docs/style_guide/`, including readability, formatting, field organization, input validation, and exit screens.
- `~/all_interviews/repos/docassemble-PetitionToChangeNameOfAdult/.../petition_to_change_name_of_adult.yml`: mandatory controller, explicit branching, review actions, and preview/download patterns. Existing legacy style in this reference is not copied wholesale.
- `~/all_interviews/repos/docassemble-CLAGuardianship/.../caregiver_authorization_affidavit.yml`: person collection and caregiver-related questions. Massachusetts legal rules are not carried over.
- `~/docassemble-ALDashboard`: field-name contract, deterministic DOCX run edits and syntax checks, and accessible field labels.

## Initial template decisions

Preserve wet signatures, initials, execution dates, and witness/notary attestations for completion when signing. Add automation labels for information gathered by the interview. The PDFs' original unfilled page rasters were compared before/after field edits; they matched. The Name Change child-2 surname needed its own field because the original erroneously shared child 3's value. The shared foreclosure owner field is intentional and retained.

## Restore the LawHelpMN asset

Reuse the same `MNfavicon-96x96.png` already supplied in Amanda’s Health Care Directive package. Both interviews referenced that exact filename but omitted it. This restores the existing intended branding without introducing a new logo or changing the interview’s theme.

## Replace the 2011 affidavit with the 2026 statutory form

Use an editable DOCX adaptation because the currently linked blank remains the 2011 revision. Keep the legal statements close to chapter 51, section 2; apply plain-language style to interview questions and instructions, not by silently rewriting sworn declarations. Separate the affidavit from instructions so contradictory deadline text is never printed in the form. Details and applicability questions are in `FORM_SOURCES.md`.

## Consistent help links — 2026-10-04

Use the verified matching LawHelpMN resource, [Your Rights in Foreclosure](https://www.lawhelpmn.org/self-help-library/fact-sheet/your-rights-foreclosure), in publishing metadata, the introduction, the download screen, and printable next steps. Keep direct court/statutory sources for form requirements. Name Change’s matching resource is a court-forms directory, not an Education for Justice fact sheet. No claim of LHI feature parity is made.

## Replace contradictory deadline and signature flow

Use one mandatory controller and recompute the 15-calendar-day cutoff when the sale date changes. Do not silently extend that filing cutoff to the next business day: the statutory next-business-day language governs the postponed sale, and any filing extension needs separate review. Avoid estimating a new sale date without an approved holiday/calendar rule. Display a specific help screen instead of redirecting or deleting the session. Allow preparation only for the currently implemented living-owner, post-April-21-2026 proceeding route. Older proceedings and representatives receive a clear help path.

Keep notary and owner execution fields blank; do not solicit a purported electronic notary signature. Require an explicit choice about the five-week redemption period. Remove stale fee claims and unrelated signature fields. Chapter 88 section 219 adds foreclosure-by-action references to the preexisting text; its interaction with chapter 51 is reserved for substantive review, rather than silently selecting an older consolidated version. Local happy-path testing reached downloads; one/two/four-owner template tests pass. Comprehensive edge-case tests are in progress.

## Execution venue

Leave both state and county of notarization blank for the actual signing. The property county is automated separately. Do not assume an affidavit concerning Minnesota property is necessarily signed in Minnesota.

## Testing approach

Use narrative ALKiln story tables plus assertions against downloaded PDF text. Include negative paths, recording-date/deadline boundaries, optional people, long text, and review edits. Save raw artifacts locally and commit only a sanitized execution summary. Keep synthetic unit/template checks in CI. Distinguish failures in test-tool compatibility from actual interview defects; document both, and never turn a failed expectation into a pass without explaining the change.

## Plain-language and question-style review — 2026-10-04

Reviewed screens against plain-language guidance and the Assembly Line "Writing good questions" guide. Eligibility labels replace jargon ("mortgagor", "dwelling units") with everyday words. The ineligible-property screen lists the specific answers that ruled the user out. A user who does not know the recording date can say so and gets a screen explaining how to find it, instead of guessing. The publication question accepts "I don't know" and leads to the same help screen as "No". When the deadline has passed, the deadline help appears before the "finish by" notice, not after it. Screens no longer show a heading question and a second, different label question together. County is a dropdown of Minnesota's 87 counties. Custom name screens replace AssemblyLine's generic "Name of the first drafter" and owner headings.

## Minnesota holiday calendar — 2026-10-05

Use `docassemble.ALToolbox.business_days.is_business_day` with `country="US", subdiv="MN"` to recommend the last business day on or before the 15-calendar-day filing cutoff. Recompute both dates in the mandatory controller after sale-date edits. Show the recommended date and the separate legal cutoff in the interview and printable instructions. Keep the late-filing gate tied to the legal cutoff; the recommendation does not shorten eligibility or extend the legal period. Confirm local office hours because the calendar does not account for every closure. The user authorized ALToolbox as the holiday calculation source. No postponed sale date is estimated because the interview does not collect the original redemption period.

## Shared LawHelpMN branding — 2026-10-05

Reference the installed `docassemble.LawHelpMNBranding` package directly: `LawHelpMNBranding_custom.css` supplies the Bootstrap theme and `LawHelpMN2x_002_resized.png` supplies the full logo. Set the AssemblyLine organization title and homepage to LawHelpMN. The branding package must be installed on the server. No branding assets or CSS adapters are copied into the interviews.
