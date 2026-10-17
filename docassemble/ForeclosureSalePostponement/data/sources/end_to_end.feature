# ALDashboard static draft reviewed against interview order and the existing regression suite.
@e2e
Feature: Complete a representative interview

  Scenario: Rosa prepares an affidavit with time to file
    # Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit.
    Given I start the interview at "foreclosure_sale_postponement.yml"
    And the maximum seconds for each step is 90
    When I get to "download foreclosure forms" with this data:
      | var | value | trigger |
      | acknowledged_information_use | True | |
      | qualifies_homestead | True | |
      | occupies_home | True | |
      | dwelling_limit | True | |
      | living_owner | True | |
      | proceeding_recorded_date | 05/01/2026 | |
      | previous_postponement | False | |
      | sale_date | today + 60 | |
      | publication_started | True | |
      | accepts_shorter_redemption | True | |
      | owner.target_number | 1 | |
      | owner[0].name.first | Rosa | |
      | owner[0].name.last | Owner | |
      | county | Ramsey | |
      | drafter[0].name.first | Sam | |
      | drafter[0].name.last | Preparer | |
      | drafter[0].address.address | 123 Example Street | |
      | drafter[0].address.city | St. Paul | |
      | drafter[0].address.state | MN | |
      | drafter[0].address.zip | 55101 | |
    Then the question id should be "download foreclosure forms"
    And I should see the link to "https://www.lawhelpmn.org/self-help-library/fact-sheet/your-rights-foreclosure"
    And I download "foreclosure_sale_postponement.pdf"
    And the downloaded PDF "foreclosure_sale_postponement.pdf" should contain "Rosa Owner"
    And the downloaded PDF "foreclosure_sale_postponement.pdf" should contain "Postponement Notice"
