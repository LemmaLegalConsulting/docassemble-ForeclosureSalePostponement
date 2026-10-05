from pathlib import Path
import unittest

import yaml
from docassemble.ALToolbox.business_days import is_business_day
from docassemble.base.util import as_datetime
from test_templates import render

ROOT = Path(__file__).resolve().parents[1]
INTERVIEW = ROOT / "docassemble/ForeclosureSalePostponement/data/questions/foreclosure_sale_postponement.yml"


class FilingDates(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        blocks = list(yaml.safe_load_all(INTERVIEW.read_text()))
        controller = next(block["code"] for block in blocks if block.get("mandatory") and "filing_cutoff =" in block.get("code", ""))
        # Execute the interview's calculation, including review-cycle recomputation.
        cls.calculation = compile(controller[controller.index("filing_cutoff ="):controller.index("if today() > filing_cutoff:")], str(INTERVIEW), "exec")

    def dates(self, sale, namespace=None):
        if namespace is None:
            namespace = {"is_business_day": is_business_day}
        namespace["sale_date"] = as_datetime(sale)
        exec(self.calculation, namespace)
        return namespace

    def test_minnesota_weekends_holidays_and_year_boundary(self):
        for sale, cutoff, recommended in [
            ("2026-10-20", "2026-10-05", "2026-10-05"),
            ("2026-07-20", "2026-07-05", "2026-07-02"),
            ("2026-11-26", "2026-11-11", "2026-11-10"),
            ("2027-01-16", "2027-01-01", "2026-12-31"),
            # Massachusetts Patriots' Day must not affect Minnesota dates.
            ("2026-05-05", "2026-04-20", "2026-04-20"),
        ]:
            with self.subTest(sale=sale):
                result = self.dates(sale)
                self.assertEqual(result["filing_cutoff"].format("yyyy-MM-dd"), cutoff)
                self.assertEqual(result["filing_business_day"].format("yyyy-MM-dd"), recommended)
                self.assertLessEqual(result["filing_business_day"], result["filing_cutoff"])
                self.assertTrue(is_business_day(result["filing_business_day"], country="US", subdiv="MN"))

    def test_sale_date_review_recomputes_both_dates(self):
        result = self.dates("2026-07-20")
        self.dates("2026-10-20", result)
        self.assertEqual(result["filing_cutoff"].format("yyyy-MM-dd"), "2026-10-05")
        self.assertEqual(result["filing_business_day"].format("yyyy-MM-dd"), "2026-10-05")

    def test_printable_instructions_show_both_dates(self):
        result = self.dates("2026-07-20")
        text = render(ROOT / "docassemble/ForeclosureSalePostponement/data/templates/foreclosure_sale_postponement_next_steps.docx", result)
        self.assertIn("Plan to finish recording and delivery by: July 2, 2026", text)
        self.assertIn("15 days before the sale: July 5, 2026", text)
        self.assertIn("Weekends and holidays do not extend the legal cutoff", text)


if __name__ == "__main__":
    unittest.main()
