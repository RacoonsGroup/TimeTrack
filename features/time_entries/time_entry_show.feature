Feature: Show TimeEntry
  In order to get detailed my time entry
  As an user
  I want to see my time entry

  Background:
    Given a user_racoon: "racoon" exists
    And I am signed in as user with email "racoon@example.com"

  Scenario: Looking my time entry
    Given time_entry exist with user: user_racoon "racoon", name: "my task", description: "Full description"
    When I go to the show time entry page for "my task"
    Then I should see my detailed time entry
