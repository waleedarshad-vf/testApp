require 'capybara'
Given(/^Initiating browser$/) do
  if ENV['BROWSER'] == "ff"
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => :firefox )
    end


  else
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome )
    end
  end
end
Given(/^Hit Site https:\/\/www\.yelp\.com$/) do
  visit 'https://www.yelp.com/'
end

When(/^Enter restaurant name to Search$/) do
  fill_in(with: 'Restaurants', id: 'find_desc')
end

When(/^Click on Search icon$/) do
  click_button 'header-search-submit'
end

Then(/^Displaying Filtered Restaurant list$/) do
  find('.all-filters-toggle').click
  
end

When(/^Append pizza with restuarant in the search field$/) do
  fill_in(with: 'pizza restaurants', id: 'find_desc')
end

When(/^Click on Search icon again$/) do
  find('.all-filters-toggle').click
end

Then(/^Compare Results of restaurants and restaurants pizza$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^Click on apply filter button$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^Click on neighbourhood and price$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^Comparing search results for filter restaurant pizza and restaurant pizza$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^compare user rating$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^Click on any item and expand result$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^Log all the information$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
