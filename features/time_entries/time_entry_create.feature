Feature: Creating TimeEntries
  In order to get paid
  As an user
  I want to create my TimeEntry

  Background:
    Given a user_racoon: "racoon" exists
    And I am signed in as user with email "racoon@example.com"

  Scenario: Looking for all fields i needed
    Given I am on new time entry page
    Then I should see all needed fields for creating time entry

  Scenario: Trying to create invalid time entry
    Given I am on new time entry page
    When I fill in invalid time entry data
    Then I should see time entry error

  Scenario: Trying to create valid time entry
    Given I am on new time entry page
    When I fill in valid time entry data
    Then I should be on the time entries page
    And I should see my time entry