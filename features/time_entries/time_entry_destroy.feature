Feature: Destroy TimeEntry
  In order to delete wrong time entry
  As an user
  I want to destroy my TimeEntry

  Background:
    Given a user_racoon: "racoon" exists
    And I am signed in as user with email "racoon@example.com"
    And a time_entry exist with user: user_racoon "racoon", name: "first_task"

  Scenario: Trying to delete my time entry
    Given I am on the time entries page
    When I removing item
    Then I should be on the time entries page
    And I should not see my time entry
