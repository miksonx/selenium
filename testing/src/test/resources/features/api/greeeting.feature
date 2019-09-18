@Selenium
Feature: Greeting

  Background:
    Given I am logged in to MyAssistant as the CI user

  Scenario: List value from greeting api
    When We send request via api
    Then the response should contain Hello
