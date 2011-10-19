@updates
Feature: Updates
  In order to have updates on my website
  As an administrator
  I want to manage updates

  Background:
    Given I am a logged in refinery user
    And I have no updates

  @updates-list @list
  Scenario: Updates List
   Given I have updates titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of updates
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @updates-valid @valid
  Scenario: Create Valid Update
    When I go to the list of updates
    And I follow "Add New Update"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 update

  @updates-invalid @invalid
  Scenario: Create Invalid Update (without title)
    When I go to the list of updates
    And I follow "Add New Update"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 updates

  @updates-edit @edit
  Scenario: Edit Existing Update
    Given I have updates titled "A title"
    When I go to the list of updates
    And I follow "Edit this update" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of updates
    And I should not see "A title"

  @updates-duplicate @duplicate
  Scenario: Create Duplicate Update
    Given I only have updates titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of updates
    And I follow "Add New Update"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 updates

  @updates-delete @delete
  Scenario: Delete Update
    Given I only have updates titled UniqueTitleOne
    When I go to the list of updates
    And I follow "Remove this update forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 updates
 