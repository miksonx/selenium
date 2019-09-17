@Selenium
@RegressionTest
@SmokeTest
Feature: Login to the Myassistant app
   In order to access the Myassistant app
   As a user of Myassistant
   I should be able to login

  Scenario: Measure the time of the feature
    Given I want to measure the time it takes to perform the test
    And this is the first feature of the test run

  Scenario: Failed Login
     Given I am at the Myassistant login page
     When I enter invalid credentials
      And I click the Login button
     Then I should get an error message saying "Hittar inte dig"


   Scenario: Successful login
     Given I am at the Myassistant login page
     When I enter credentials
      And I click the Login button
     Then I should come to the overview page
     And I should be logged in as "Jenkins Bamboo"


  Scenario: Publish the time of the feature
    Given the feature has been run through
    Then we should publish data for the test feature "Login test"