Feature: Creating TimeEntries
  In order to get my money
  As an user
  I want to edit my TimeEntry

    Background:
      Given a user_racoon: "racoon" exists
      And I am signed in as user with email "racoon@example.com"
      And a time_entry exist with user: user_racoon "racoon", name: "first_task"

    Scenario: Looking for for all fields i needed
      Given I am on the edit time entry page for "first_task"
      Then I should see all needed fields for edit time entry

    Scenario: Trying to edit invalid time entry
      Given I am on the edit time entry page for "first_task"
      When I fill in invalid time entry data
      Then I should see time entry error  

    Scenario: Trying to edit valid time entry
      Given I am on the edit time entry page for "first_task"
      When I fill in valid time entry data
      Then I should be on the time entries page
      And I should see my time entry  
