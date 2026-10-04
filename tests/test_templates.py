from pathlib import Path
from tempfile import TemporaryDirectory
from types import SimpleNamespace
import unittest
from docx import Document
from docxtpl import DocxTemplate
from jinja2 import Environment, StrictUndefined
ROOT=Path(__file__).resolve().parents[1]
class Person:
 def __init__(self,name):
  self.name=name;self.relationship='Friend';self.phone_number='612-555-0100';self.birthdate='January 2, 1970'
  self.address=SimpleNamespace(on_one_line=lambda:'123 Example Street, St. Paul, MN 55101',block=lambda:'123 Example Street\nSt. Paul, MN 55101')
 def __str__(self):return self.name
class People(list):
 def __str__(self):return ' and '.join(map(str,self))
PREFERENCES=['health_care_goals','health_care_fears','spiritual_beliefs','beliefs_about_quality_of_life','thoughts_about_family','pregnancy_care_wishes','temporary_incapacity_wishes','dying_care_wishes','permanent_unconsciousness_wishes','dependent_care_wishes','pain_relief_wishes','preferred_doctor','preferred_care_location','preferred_dying_location','organ_donation_wishes','body_disposition_wishes','other_health_care_wishes']
def render(path,context):
 with TemporaryDirectory() as tmp:
  dest=Path(tmp)/'rendered.docx';doc=DocxTemplate(path)
  doc.render(context,jinja_env=Environment(undefined=StrictUndefined),autoescape=True);doc.save(dest)
  result=Document(dest)
  text='\n'.join(p.text for p in result.paragraphs)
  assert '{{' not in text and '{%' not in text
  return text
class ForeclosureTemplates(unittest.TestCase):
 def test_current_sale_and_all_owners_in_2026_affidavit(self):
  path=ROOT/'docassemble/ForeclosureSalePostponement/data/templates/foreclosure_sale_postponement.docx'
  for count in (1,2,4):
   with self.subTest(owners=count):
    people=People([Person('Owner '+str(i)) for i in range(count)])
    text=render(path,{'owner':people,'drafter':People([Person('Drafter Example')]),'county':'Ramsey','sale_date':SimpleNamespace(format=lambda:'November 20, 2026')})
    self.assertIn('Postponement Notice',text);self.assertIn('scheduled for November 20, 2026',text)
    self.assertIn('five weeks',text);self.assertNotIn('Your deadline was',text)
    self.assertEqual(text.splitlines().count('Owner signature'),count)
    for person in people:self.assertIn(str(person),text)
if __name__=='__main__':unittest.main()
