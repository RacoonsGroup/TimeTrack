Feature: Show Statistics
  In order to get detailed my statistics
  As an user
  I want to see my statistics

  Background:
    Given a user_racoon: "racoon" exists
    And I am signed in as user with email "racoon@example.com"

  Scenario: Statistics
    When I go to the statistics page
    Then I should get a response with status 200
    Then I should get a filter_form
    Then I should get a datepicker
    Then I should get a table
