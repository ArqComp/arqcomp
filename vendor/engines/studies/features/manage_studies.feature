@studies
Feature: Studies
  In order to have studies on my website
  As an administrator
  I want to manage studies

  Background:
    Given I am a logged in refinery user
    And I have no studies

  @studies-list @list
  Scenario: Studies List
   Given I have studies titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of studies
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @studies-valid @valid
  Scenario: Create Valid Study
    When I go to the list of studies
    And I follow "Add New Study"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 study

  @studies-invalid @invalid
  Scenario: Create Invalid Study (without title)
    When I go to the list of studies
    And I follow "Add New Study"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 studies

  @studies-edit @edit
  Scenario: Edit Existing Study
    Given I have studies titled "A title"
    When I go to the list of studies
    And I follow "Edit this study" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of studies
    And I should not see "A title"

  @studies-duplicate @duplicate
  Scenario: Create Duplicate Study
    Given I only have studies titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of studies
    And I follow "Add New Study"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 studies

  @studies-delete @delete
  Scenario: Delete Study
    Given I only have studies titled UniqueTitleOne
    When I go to the list of studies
    And I follow "Remove this study forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 studies
 