@study_categories
Feature: Study Categories
  In order to have study_categories on my website
  As an administrator
  I want to manage study_categories

  Background:
    Given I am a logged in refinery user
    And I have no study_categories

  @study_categories-list @list
  Scenario: Study Categories List
   Given I have study_categories titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of study_categories
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @study_categories-valid @valid
  Scenario: Create Valid Study Category
    When I go to the list of study_categories
    And I follow "Add New Study Category"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 study_category

  @study_categories-invalid @invalid
  Scenario: Create Invalid Study Category (without name)
    When I go to the list of study_categories
    And I follow "Add New Study Category"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 study_categories

  @study_categories-edit @edit
  Scenario: Edit Existing Study Category
    Given I have study_categories titled "A name"
    When I go to the list of study_categories
    And I follow "Edit this study_category" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of study_categories
    And I should not see "A name"

  @study_categories-duplicate @duplicate
  Scenario: Create Duplicate Study Category
    Given I only have study_categories titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of study_categories
    And I follow "Add New Study Category"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 study_categories

  @study_categories-delete @delete
  Scenario: Delete Study Category
    Given I only have study_categories titled UniqueTitleOne
    When I go to the list of study_categories
    And I follow "Remove this study category forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 study_categories
 