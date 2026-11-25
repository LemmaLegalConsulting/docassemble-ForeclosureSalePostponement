# Foreclosure form source and revision history

## Replacement decision — 2026-10-04

Quinten explicitly requested the new form. The original package used Form 60.8.1 (2011) and embedded obsolete, contradictory instruction pages in the same PDF. LawHelpMN’s September 2026 fact sheet still links a blank PDF whose printed revision is **2011**; a new upload date is not a new legal form version.

The replacement `foreclosure_sale_postponement.docx` is a **Lemma adaptation of the 2026 statutory affidavit**, not a claim that Commerce has issued a new numbered UCB form. It follows 2026 chapter 51, section 2: Notice of Sale or Postponement Notice, an explicit scheduled-sale date, the three sworn statements, owner signatures, and notary acknowledgment. It uses “They are” from the form’s pronoun alternatives for one or more owners. The first page reserves three inches for recording data. Drafter information is retained from the prior recording form. Witnessing/notarization fields remain blank for actual execution.

## Primary sources

- [2026 chapter 51, sections 1–2](https://www.revisor.mn.gov/laws/2026/0/51/laws.0.1.0), signed April 21, 2026. A source copy is in `data/sources/2026-chapter-51.html`.
- [2026 chapter 88, article 1, sections 219 and 225](https://www.revisor.mn.gov/laws/2026/0/88/laws.1.219.0). Section 225 expressly gives other overlapping 2026 amendments priority regardless of enactment order. Do not read section 219 alone as restoring the older language.
- [Current consolidated section 580.07](https://www.revisor.mn.gov/statutes/cite/580.07), which incorporates the 2026 amendments. This supports the statutory-form approach; it does not establish client approval of this adaptation or every supported workflow.
- [Section 645.15](https://www.revisor.mn.gov/statutes/cite/645.15) and [section 645.151](https://www.revisor.mn.gov/statutes/cite/645.151), general time-computation and government-filing provisions requiring review alongside the postponement deadline.
- [LawHelpMN Your Rights in Foreclosure, updated September 2026](https://www.lawhelpmn.org/self-help-library/fact-sheet/your-rights-foreclosure).
- [Blank linked from that fact sheet](https://www.lawhelpmn.org/sites/default/files/2026-09/60.8.1AffidavitofPostponement_0.pdf), saved as `data/sources/lawhelpmn-september-2026-affidavit.pdf`. Its printed date is 2011.

The old automated PDF remains under `reference/legacy/` for comparison and is no longer an output template.

## Decisions still requiring substantive review

Chapter 51 applies according to the recording date of the notice of pendency or lis pendens (effective the day after enactment), not merely the sale date. Counsel must approve older-proceeding treatment and the application of the combined amendments to exceptional cases.

The technical repairs on November 13, 2026 do not resolve these release questions:

- **Deadline counting:** reconcile sections 645.15 and 645.151 with the backward-counted postponement period. Determine whether recording, sheriff filing, and delivery to a private attorney receive different treatment. The existing calendar subtraction and categorical no-extension wording remain unchanged pending counsel review; passing arithmetic tests does not validate that legal assertion.
- **Eligibility and redemption:** approve how to establish the statutory redemption category, handle unknown or exceptional periods, and explain the redemption amount and five-week tradeoff.
- **Signers and notarization:** approve who should sign, the facts each added signer must attest to, and execution before different notaries or on different dates. Representative and deceased-owner routes remain unsupported.
- **Complete filing packet:** confirm notice attachments and legal descriptions, rescheduled sales, Abstract/Torrens or multicounty recording, local fees and delivery methods, and evidence that the sale was actually postponed.

Keep testing/unlisted metadata until substantive and operational acceptance. A successful render or technical check is not approval to publish.
