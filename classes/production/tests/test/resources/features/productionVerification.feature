@Selenium
@ProductionTest
Feature: Production verification

  Background:
    Given I am logged in to Myassistant as the CI user
      And I want to measure the time it takes to perform the test

  Scenario: Measure the time for the feature
    Given I want to measure the time it takes to perform the test
    And this is the first feature of the test run


  Scenario: Verify the donors card
    Given I am at the donors and donations tab
    When I search for a production donor
    Then I should see the donors card for the production donor
      And it should be possible to veiw contents of the donors card tabs

  Scenario: Search for a donation
    Given I am at the donors and donations tab
    When I search for a specific production donation
    Then I should get one donation search hit

  Scenario: Search for a collection
    Given I am at the donors and donations tab
    When I search for a specific production collection
    Then I should get one collection search hit

  Scenario: Open payment plan tab
    Given I am at the donors and donations tab
    Then I open the search payment plan tab

  Scenario: Search for thank you letters
    Given I am at the letters and mailing tab
    When I search for some thank you letters
    Then the thank you letters result list should be visible

  Scenario: Search for ag thank you letters
    Given I am at the letters and mailing tab
    When I search for ag welcome letters
    Then the ag welcome letters result list should be visible

  Scenario: Search for articles
    Given I am at the letters and mailing tab
    When I search for webshop donations
    Then the articles result list should be visible


  Scenario: Search for cases
    Given I am at the cases tab
    When I search for a production case
    Then I should get a case search hit

  Scenario: Open some tabs that are not opened in other production tests
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

  Scenario: Print time for test
    Given see how long time it took


  Scenario: Publish the time of the feature
    Given the feature has been run through
    Then we should publish data for the test feature "Production verification feature"



#find a way to verify letter templates...
#  Scenario: Browse through the letter templates
#    Given I am at the letter templates page
#    Then I can view all the letter templates one by one