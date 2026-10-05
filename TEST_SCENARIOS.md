# Narrative scenarios and acceptance coverage

All people and addresses are synthetic. Story tables describe the current implementation; passing them does not establish legal completeness or LHI parity. See `validation/` for actual execution results, not an assumed pass.

| Tag | Persona / scenario | Purpose and expectation | Destination |
| --- | --- | --- | --- |
| `foreclosure_one_owner` | Rosa prepares an affidavit with time to file | Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit. | `download foreclosure forms` |
| `foreclosure_two_owners` | Rosa and Luis both sign | Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit. | `download foreclosure forms` |
| `cutoff_today` | Rosa acts exactly 15 days before sale | Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit. | `download foreclosure forms` |
| `too_late` | Rosa has only 14 days before sale | Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit. | `deadline help` |
| `old_proceeding` | Elena has an April 21 proceeding | Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit. | `older proceeding help` |
| `effective_date` | Elena has an April 22 proceeding | Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit. | `download foreclosure forms` |
| `not_homestead` | Kai asks about an investment property | Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit. | `unsupported property or representative` |
| `not_occupied` | Kai does not occupy the property | Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit. | `unsupported property or representative` |
| `five_units` | Kai owns a five-unit building | Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit. | `unsupported property or representative` |
| `deceased_owner` | Nia is acting for a deceased parent | Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit. | `unsupported property or representative` |
| `already_postponed` | Morgan already used owner postponement | Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit. | `prior postponement help` |
| `unpublished` | Avery has no published notice yet | Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit. | `publication help` |
| `declines_redemption` | Jordan declines the five-week tradeoff | Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit. | `redemption help` |

## Invalid-date scenario

- `future_recording_date`: Rosa enters a notice recording date in the future. The interview must reject that date on the question screen instead of generating an affidavit.

## Additional review

Inspect long-answer pagination, signatures, mobile/keyboard navigation, and PDF reading order. Compare output with source forms and client-approved examples. Test limitations that require manual extra sheets as limitations, not as automated completion.

- `sale_date_review`: Rosa corrects the sale date to within 14 days. Edit existing answers and assert the changed document or help screen.
- `unknown_recording_date`: Rosa does not know the recording date. Assert the help screen that explains how to find it.

## Testing gaps to preserve for client review

No live LHI parity comparison, production deployment, full screen-reader audit, or client legal-content acceptance is claimed. See IMPROVEMENTS.md for the ordered remaining work. Extra-sheet workflows must be reviewed as manual steps.
