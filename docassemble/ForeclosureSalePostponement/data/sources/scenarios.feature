Feature: Narrative regression scenarios

  @foreclosure_one_owner
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

  @foreclosure_two_owners
  Scenario: Rosa and Luis both sign
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
      | owner.target_number | 2 | |
      | owner[0].name.first | Rosa | |
      | owner[0].name.last | Owner | |
      | county | Ramsey | |
      | drafter[0].name.first | Sam | |
      | drafter[0].name.last | Preparer | |
      | drafter[0].address.address | 123 Example Street | |
      | drafter[0].address.city | St. Paul | |
      | drafter[0].address.state | MN | |
      | drafter[0].address.zip | 55101 | |
      | owner[1].name.first | Luis | |
      | owner[1].name.last | Coowner | |
    Then the question id should be "download foreclosure forms"
    And I should see the link to "https://www.lawhelpmn.org/self-help-library/fact-sheet/your-rights-foreclosure"
    And I download "foreclosure_sale_postponement.pdf"
    And the downloaded PDF "foreclosure_sale_postponement.pdf" should contain "Rosa Owner"
    And the downloaded PDF "foreclosure_sale_postponement.pdf" should contain "Postponement Notice"
    And the downloaded PDF "foreclosure_sale_postponement.pdf" should contain "Luis Coowner"

  @cutoff_today
  Scenario: Rosa acts exactly 15 days before sale
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
      | sale_date | today + 15 | |
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

  @too_late
  Scenario: Rosa has only 14 days before sale
    # Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit.
    Given I start the interview at "foreclosure_sale_postponement.yml"
    And the maximum seconds for each step is 90
    When I get to "deadline help" with this data:
      | var | value | trigger |
      | acknowledged_information_use | True | |
      | qualifies_homestead | True | |
      | occupies_home | True | |
      | dwelling_limit | True | |
      | living_owner | True | |
      | proceeding_recorded_date | 05/01/2026 | |
      | previous_postponement | False | |
      | sale_date | today + 14 | |
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
    Then the question id should be "deadline help"

  @old_proceeding
  Scenario: Elena has an April 21 proceeding
    # Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit.
    Given I start the interview at "foreclosure_sale_postponement.yml"
    And the maximum seconds for each step is 90
    When I get to "older proceeding help" with this data:
      | var | value | trigger |
      | acknowledged_information_use | True | |
      | qualifies_homestead | True | |
      | occupies_home | True | |
      | dwelling_limit | True | |
      | living_owner | True | |
      | proceeding_recorded_date | 04/21/2026 | |
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
    Then the question id should be "older proceeding help"

  @effective_date
  Scenario: Elena has an April 22 proceeding
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
      | proceeding_recorded_date | 04/22/2026 | |
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

  @not_homestead
  Scenario: Kai asks about an investment property
    # Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit.
    Given I start the interview at "foreclosure_sale_postponement.yml"
    And the maximum seconds for each step is 90
    When I get to "unsupported property or representative" with this data:
      | var | value | trigger |
      | acknowledged_information_use | True | |
      | qualifies_homestead | False | |
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
    Then the question id should be "unsupported property or representative"

  @not_occupied
  Scenario: Kai does not occupy the property
    # Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit.
    Given I start the interview at "foreclosure_sale_postponement.yml"
    And the maximum seconds for each step is 90
    When I get to "unsupported property or representative" with this data:
      | var | value | trigger |
      | acknowledged_information_use | True | |
      | qualifies_homestead | True | |
      | occupies_home | False | |
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
    Then the question id should be "unsupported property or representative"

  @five_units
  Scenario: Kai owns a five-unit building
    # Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit.
    Given I start the interview at "foreclosure_sale_postponement.yml"
    And the maximum seconds for each step is 90
    When I get to "unsupported property or representative" with this data:
      | var | value | trigger |
      | acknowledged_information_use | True | |
      | qualifies_homestead | True | |
      | occupies_home | True | |
      | dwelling_limit | False | |
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
    Then the question id should be "unsupported property or representative"

  @deceased_owner
  Scenario: Nia is acting for a deceased parent
    # Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit.
    Given I start the interview at "foreclosure_sale_postponement.yml"
    And the maximum seconds for each step is 90
    When I get to "unsupported property or representative" with this data:
      | var | value | trigger |
      | acknowledged_information_use | True | |
      | qualifies_homestead | True | |
      | occupies_home | True | |
      | dwelling_limit | True | |
      | living_owner | False | |
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
    Then the question id should be "unsupported property or representative"

  @already_postponed
  Scenario: Morgan already used owner postponement
    # Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit.
    Given I start the interview at "foreclosure_sale_postponement.yml"
    And the maximum seconds for each step is 90
    When I get to "prior postponement help" with this data:
      | var | value | trigger |
      | acknowledged_information_use | True | |
      | qualifies_homestead | True | |
      | occupies_home | True | |
      | dwelling_limit | True | |
      | living_owner | True | |
      | proceeding_recorded_date | 05/01/2026 | |
      | previous_postponement | True | |
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
    Then the question id should be "prior postponement help"

  @unpublished
  Scenario: Avery has no published notice yet
    # Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit.
    Given I start the interview at "foreclosure_sale_postponement.yml"
    And the maximum seconds for each step is 90
    When I get to "publication help" with this data:
      | var | value | trigger |
      | acknowledged_information_use | True | |
      | qualifies_homestead | True | |
      | occupies_home | True | |
      | dwelling_limit | True | |
      | living_owner | True | |
      | proceeding_recorded_date | 05/01/2026 | |
      | previous_postponement | False | |
      | sale_date | today + 60 | |
      | publication_started | False | |
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
    Then the question id should be "publication help"

  @declines_redemption
  Scenario: Jordan declines the five-week tradeoff
    # Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit.
    Given I start the interview at "foreclosure_sale_postponement.yml"
    And the maximum seconds for each step is 90
    When I get to "redemption help" with this data:
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
      | accepts_shorter_redemption | False | |
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
    Then the question id should be "redemption help"


  @sale_date_review
  Scenario: Rosa corrects the sale date to within 14 days
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
    When I follow the review link containing "Edit answers"
    And I follow the review link containing "Scheduled sale:"
    And I get to "foreclosure review" with this data:
      | var | value | trigger |
      | sale_date | today + 14 | |
    When I tap to continue
    Then the question id should be "deadline help"
    Then I should see the phrase "Get help right away"


  @future_recording_date
  Scenario: Rosa enters a future recording date
    # Verify the supported route or a specific help screen without losing the session or preparing an inappropriate affidavit.
    Given I start the interview at "foreclosure_sale_postponement.yml"
    And the maximum seconds for each step is 90
    When I get to "proceeding date" with this data:
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
    When I set the variable "proceeding_recorded_date" to "today + 1"
    And I tap to continue
    Then I will be told an answer is invalid
    And the question id should be "proceeding date"
