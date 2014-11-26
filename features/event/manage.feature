Feature: Manage Events
  In order to produce content
  As an user
  I want to create and manage events
  
  Background:
    Given I am logged in

  @wip
  Scenario: Create Valid Event
    Given I have no events
    When I create a new event
    Then I should see the new event page
    And I should see the event in index page

  @wip
  Scenario: Update Valid Event
    Given I have an event
    When I update the event
    Then I should see the event page with new data
