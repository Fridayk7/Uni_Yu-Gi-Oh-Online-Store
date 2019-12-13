# feature/hello_cucumber.feature
Feature: email_password_vlidation
  As a guest
  I want to be able to see the products but not make an order
  So that i am forced to make an account first

  Scenario: User sees the log in message
    Given I am on the stocks page
    When I click on show and order now
    Then I should be redirected to the login page
