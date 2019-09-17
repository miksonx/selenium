@Selenium
Feature: As a Continuous integration system I expect some stuff to be present in the database
  so that I can run my tests

#  Scenario: Create CI user
#    Given I have logged in to Myassistant with users admin credentials
#      And I have navigated to the users tab under administration
#  Then I should be able to create a user if it is not already present

  Scenario: Create CI donor
    Given I have logged in to Myassistant with admin credentials
      And I am at the donors and donations tab
    Then I should create a donor if it is not already present

  Scenario: Create CI donor2
    Given I have logged in to Myassistant with admin credentials
    And I am at the donors and donations tab
    Then I should create a second donor if it is not already present

  Scenario: Create CI estate donor
    Given I have logged in to Myassistant with admin credentials
      And I am at the donors and donations tab
    Then I should create an estate donor if it is not already present

  Scenario: Create a memorial collection
    Given I am logged in to Myassistant as the CI user
      And I am at the donors and donations tab
    Then I should be able to create a new memorial collection if not already present

  Scenario: Create a company user for duplicates management
    Given I am logged in to Myassistant as the CI user
      And I am at the donors and donations tab
    Then I should be able to create a new company donor for duplicates management if not already present

  Scenario: Create a company donor
    Given I am logged in to Myassistant as the CI user
      And I am at the donors and donations tab
    Then I should be able to create a new company donor if not already present

  Scenario: Create a user without address with a donation
    Given I am logged in to Myassistant as the CI user
      And I am at the donors and donations tab
    Then I should be able to create a new donor without address if not already present

#  Scenario: Create a campaign
#    Given I am logged in to Myassistant as the CI user
#    And I am at the campaign tab
#    Then I should be able to create a new campaign if not already present
