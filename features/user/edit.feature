Feature: Edit User
  As a registered user of the website
  I want to edit my user profile and user account
  so I can change my data

    Scenario: User edits account successfully
      Given I am logged in
      When I edit my account details with valid data
      Then I should see an account edited message

    Scenario: User edits profile successfully
      Given I am logged in
      When I edit my profile details with valid data
      Then I should see the new profile data
