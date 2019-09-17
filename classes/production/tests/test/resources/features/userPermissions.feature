@Selenium
@RegressionTest
@ProductionTest
Feature: Users with different permissions should see different functions in the system

  Background: Logged in with users admin permissions
    Given I have logged in to Myassistant with users admin credentials

  Scenario: User has no admin permissions
    Given I have given the ci_user permissions without admin rights
    When I log out
      And I am logged in to Myassistant as the CI user
    Then I should not see the administration or system tabs
      And I should not have access to the administration or system urls

  Scenario: User has no letters and mailings permissions
    Given I have given the ci_user permissions without letters and mailings rights
    When I log out
      And I am logged in to Myassistant as the CI user
    Then I should not see the letters and mailings tab
      And I should not have access to the letters and mailing url

  Scenario: User has no files permissions
    Given I have given the ci_user permissions without files rights
    When I log out
      And I am logged in to Myassistant as the CI user
    Then I should not see the files tab
      And I should not have access to the files url

  Scenario: User has no process and campaign permissions
    Given I have given the ci_user permissions without process and campaign rights
    When I log out
      And I am logged in to Myassistant as the CI user
    Then I should not see the process or campaign tabs
      And I should not have access to the campaign or process url

  Scenario: User has no cases permissions
    Given I have given the ci_user permissions without cases rights
    When I log out
      And I am logged in to Myassistant as the CI user
    Then I should not see the cases tab
    And I should not have access to the cases url

  Scenario: User has admin permissions
    Given I have given the ci_user permissions with admin rights
    When I log out
    And I am logged in to Myassistant as the CI user
    Then I should not see the system tab
      And I should have access to the administration urls

#TODO:  Checking/un-checking of the checkbox in Right Form "SÖK ANVÄNDARE"
#Scenario: User is not set to active
#   Given I have made a user inactive
#    When I log out
#    And I enter credentials
#    And I click the Login button
#    Then I should get an error message saying "Användaren är inte aktiverad"
#    And I should not have url access to any of the Myassistant pages

#Scenario: User is set to active
# TODO: Fix scenario User is set to active
#  Given I have made a user active
#   When I log out
#   And I enter credentials
#   And I click the Login button
#   Then I should be logged in as "Jenkins Bamboo"
