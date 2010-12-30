Feature: User management
  In order to do stuff
  As a user
  I want to be able to sign up and login

  @javascript
  Scenario: Sign up
    Given I am on the index page
    And I follow "Signup"
    When I fill in "name" with "User"
    And I fill in "password" with "secret"
    And I click "Signup"
    Then I should see "Welcome User"

  @javascript
  Scenario: Log in
    Given a user "User" with password "secret" exists
    When I am on the index page
    And I follow "Login"
    And I fill in "name" with "User"
    And I fill in "password" with "secret"
    And I click "Login"
    Then I should see "Welcome User"
