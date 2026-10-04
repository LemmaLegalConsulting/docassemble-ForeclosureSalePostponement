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
