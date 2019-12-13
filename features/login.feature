# feature/hello_cucumber.feature
Feature: Login Page
  As a manager
  I want the defualt page to be the login page
  So that they can easily login

  Scenario: User sees the log in message
    When I go to the homepage
    Then I should see the log in message
