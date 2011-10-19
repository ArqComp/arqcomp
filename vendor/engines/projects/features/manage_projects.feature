@projects
Feature: Projects
  In order to have projects on my website
  As an administrator
  I want to manage projects

  Background:
    Given I am a logged in refinery user
    And I have no projects

  @projects-list @list
  Scenario: Projects List
   Given I have projects titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of projects
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @projects-valid @valid
  Scenario: Create Valid Project
    When I go to the list of projects
    And I follow "Add New Project"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 project

  @projects-invalid @invalid
  Scenario: Create Invalid Project (without title)
    When I go to the list of projects
    And I follow "Add New Project"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 projects

  @projects-edit @edit
  Scenario: Edit Existing Project
    Given I have projects titled "A title"
    When I go to the list of projects
    And I follow "Edit this project" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of projects
    And I should not see "A title"

  @projects-duplicate @duplicate
  Scenario: Create Duplicate Project
    Given I only have projects titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of projects
    And I follow "Add New Project"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 projects

  @projects-delete @delete
  Scenario: Delete Project
    Given I only have projects titled UniqueTitleOne
    When I go to the list of projects
    And I follow "Remove this project forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 projects
 