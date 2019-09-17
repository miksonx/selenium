@Selenium
@SmokeTest
@RegressionTest
Feature: Click on all tabs on top of the page

  Background:
    Given I am logged in to Myassistant as the CI user

  Scenario: Measure the time for the feature
     Given I want to measure the time it takes to perform the test
     And this is the first feature of the test run

  Scenario: 'Click on all tabs' feature
    Given I am at the donors and donations tab
    Then I should see a search header
    Given I am at the letters and mailing tab
    Then I should see the printouts made today
    Given I am at the files tab
    Then I should see a files list
    Given I am at the campaigns page
    Then I should see a campaign list
    Given I am at the prospects page
    Then I should see a prospects list
    Given I am at the blocked persons page
    Then I should see a blocked persons list
    Given I am at the campaign processes page
    Then I should see a new process button
    Given I am at the cases tab
    Then I should see a search donors header

  Scenario: Publish the time of the feature
    Given the feature has been run through
    Then we should publish data for the test feature "Click on all tabs on top of the page"
