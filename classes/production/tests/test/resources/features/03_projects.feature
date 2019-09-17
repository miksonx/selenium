@Selenium
@RegressionTest
Feature: As a Myassistant user I want to handle projects

  Background:
    Given I am logged in to Myassistant as the CI user

  Scenario: I want to create a project type
    Given I have logged in to Myassistant with users admin credentials
    And I am at the project types page
    When I click the "+" icon on to the right on the header
    And I fill in the fields in the project type dialog
    And I click the save button to close the project dialog
    Then I should get an info message saying "Projekttyp skapad!"

  Scenario: I want to create a new project
   Given I am at the projects tab
   And I click the handle project icon on the top right on the sidebar
   When I click "Skapa nytt projekt"
   And I fill in the fields in the project form
   And I click the save button
   Then I should get an info message saying "Projekt sparat"

  Scenario: I want to create a donation type having the base type "Projekt"
    Given I have logged in to Myassistant with users admin credentials
    And I am at the donation types page
    When I click the "+" icon on to the right on the donations type header
    And I fill in the fields in the donations type dialog
    And I click the save donation type button to close the donations typedialog
    Then I should get an info message saying "Gåvotyp sparad!"

  Scenario: I can verify the the new donation type exists in the donation type menu
    Given I have logged in to Myassistant with users admin credentials
    When I clear the cache from old donation types
    Then The new donation type can be found in the menu

  Scenario: I want to define a new relation type
    Given: I have logged in to Myassistant with users admin credentials
    And I am at the code konfiguration page
    #TODO: Complete new relation type definition test

  #TODO: Implement scenario I want to create a relation between a project and a donor
  Scenario: I want to create a relation between a project and a donor
    Given I am at the projects tab
  #TODO: Implement scenario I want to connect an AG payment plan to a project
  Scenario: I want to connect an AG payment plan to a project
    Given I am at the projects tab
  #TODO: Implement scenario I want to connect an OCR agreement to a project
  Scenario: I want to connect an OCR agreement to a project
    Given I am at the projects tab
  #TODO: Implement scenario I want to connect a donation to a project
  Scenario: I want to connect a donation to a project
    Given I am at the projects tab












