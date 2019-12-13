# feature/hello_cucumber.feature
Feature: email_password_vlidation
  As a manager
  I want to have email and password validation
  So that users can login with false credentials

  Scenario: User sees the log in message
    Given I am on the login page
    When I fill in the login form with false credentials
    Then I should see an error message
