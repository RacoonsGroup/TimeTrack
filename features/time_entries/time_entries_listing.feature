Feature: Listing TimeEntries
  In order to post my job time
  As an user
  I want to see my TimeEntries
  
  Scenario: TimeEntries Listing
    Given a user_racoon: "racoon" exists
    And I am signed in as user with email "racoon@example.com"
    And a time_entry exist with user: user_racoon "racoon", name: "first_task"
    And a time_entry exist with user: user_racoon "racoon", name: "second_task"
    When I go to the time entries page
    Then I should see "first_task"
    Then I should see "second_task"

  Scenario: Others TimeEntries
    Given a user_racoon: "racoon" exists
    And a user_fox: "fox" exists
    And I am signed in as user with email "fox@example.com"
    And a time_entry exist with user: user "racoon", name: "first_task"
    When I go to the time entries page
    Then I shouldn't see "first_task"

