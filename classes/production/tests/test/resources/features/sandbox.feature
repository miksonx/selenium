@Selenium
Feature: Feature file to play around and try things out

Scenario: Apica monitoring reproduced
  Given I want to measure the time it takes to perform the test
  And I am logged in to Myassistant as the CI user
  When I quick search for a user
    And verify that there is a donation present
  Then I should log out
    And see how long time it took

Scenario: Put some load on the system


Scenario: Updating json generation
  Given I send a donation request on the api

Scenario: create plente cases
  Given I am logged in to Myassistant as the CI user
  Then I create plenty cases

Scenario: delete all contacts
  Given I am logged in to Myassistant as the CI user
  And I am at the donors and donations tab
  Given I have opened a company donors card
  When I open the contacts tab
  Then I delete all contacts

  Scenario: BGMAX sandbox
  Given I have created a few different single and multi donations
  And I create a EOH file
  #kör in filen i Myassistant för att simulera att vi får in betalningsinfo
  When I have a manual breakpoint
  Then the donations from the bgmax scenario should be in status Klar, ej bokförd


Scenario: Verify organization type
  Given I have logged in to Myassistant with users admin credentials
  And there is a deceased private donor
  Then verify it