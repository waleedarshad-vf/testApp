
Feature: Search restaurant for yelp web application
  Background:
    Given Initiating browser
  @Search
  Scenario: Search restaurant for yelp web application
    Given Hit Site https://www.yelp.com
    When Enter restaurant name to Search
    And Click on Search icon
    Then Displaying Filtered Restaurant list
    When Append pizza with restuarant in the search field
    And Click on Search icon again
    Then Compare Results of restaurants and restaurants pizza
    When Click on apply filter button
    And Click on neighbourhood and price
    Then Comparing search results for filter restaurant pizza and restaurant pizza
    And compare user rating
    And Click on any item and expand result
    And Log all the information