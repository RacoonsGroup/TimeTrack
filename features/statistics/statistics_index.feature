Feature: Show Statistics
  In order to get detailed my statistics
  As an user
  I want to see my statistics

  Background:
    Given a user_racoon: "racoon" exists
    And I am signed in as user with email "asd@mail.dsa"

  Scenario: Looking my statistics
    Given time_entry exist with user: user_racoon "racoon", name: "my task", description: "Full description"
    When I go to the show time entry page for "my task"
    Then I should see my detailed time entry
