Feature: Manage Events
  In order to produce content
  As an user
  I want to create and manage events
  
  Scenario: Create Valid Event
    Given I have no events
    When I click "Criar Evento"
    When I fill an event with valid data
    And I press "Criar Evento"
    Then I should see the event page
    And I should see the event in index page
