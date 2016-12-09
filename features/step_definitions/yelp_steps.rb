require 'capybara'
require 'byebug'
extend Pages
Before do |scenario|
  @page = Pages::Yelp.new
end
Given(/^Initiating browser$/) do
  @page.initiate_browser()
end
Given(/^Hit Site https:\/\/www\.yelp\.com$/) do
  @page.site_url
end

When(/^Enter restaurant name to Search$/) do
  @page.fill_with_id('Restaurants','find_desc')
end

When(/^Click on Search icon$/) do
  sleep(10)
  @page.click_yelp_button 'header-search-submit'
end

Then(/^Displaying Filtered Restaurant list$/) do
  sleep(10)
  @page.find_yelp_element('.all-filters-toggle').click
end

When(/^Append pizza with restuarant in the search field$/) do
  @page.fill_with_id('pizza restaurants','find_desc')
end

When(/^Click on Search icon again$/) do
  @page.find_yelp_element('.all-filters-toggle').click
end

Then(/^Compare Results of restaurants and restaurants pizza$/) do
  sleep 10 
  expect(@page.search_results('.pagination-results-window').text.split(' ').last).to eq('79910')
end

When(/^Click on apply filter button$/) do
  @page.find_yelp_element('.all-filters-toggle').click
  
end

When(/^Click on neighbourhood and price$/) do
  sleep 10
  @page.find_yelp_element('#wrap > div.main-content-wrap.main-content-wrap--full > div.top-shelf.top-shelf-grey > div > div.clearfix.layout-block.layout-full.search-page-top > div > div.filter-panel > div.filter-panel_filters > div.filter-set.price-filters > ul > li:nth-child(2) > label > span').click &&
  @page.find_yelp_element('#wrap > div.main-content-wrap.main-content-wrap--full > div.top-shelf.top-shelf-grey > div > div.clearfix.layout-block.layout-full.search-page-top > div > div.filter-panel > div.filter-panel_filters > div.filter-set.place-filters > ul.main > li:nth-child(2) > label > span').click
end

Then(/^Comparing search results for filter restaurant pizza and restaurant pizza$/) do
  
  sleep 10
  expect(@page.search_after_results('.pagination-results-window').text.split(' ').last).to eq('3160')
end

Then(/^compare user rating$/) do
  
expect(@page.get_element_star_rating("#super-container > div > div.clearfix.layout-block.layout-a.scroll-map-container.search-results-block > div.column.column-alpha > div > div.search-results-content > ul:nth-child(2) > li:nth-child(1) > div.search-result > div.biz-listing-large > div.main-attributes > div.media-block.media-block--12 > div.media-story > div.biz-rating > div.i-stars")).should include('4.0','4.5','5.0')
#### dynamic ratings finder need attention.
  # [1..9].each do |index|
  #   byebug
  #   put "#super-container > div > div.clearfix.layout-block.layout-a.scroll-map-container.search-results-block > div.column.column-alpha > div > div.search-results-content > ul:nth-child(2) > li:nth-child(#{index}) > div.search-result > div.biz-listing-large > div.main-attributes > div.media-block.media-block--12 > div.media-story > div.biz-rating > div.i-stars \n"

  #   # expect(@page.get_element_star_rating("#super-container > div > div.clearfix.layout-block.layout-a.scroll-map-container.search-results-block > div.column.column-alpha > div > div.search-results-content > ul:nth-child(2) > li:nth-child(#{index}) > div.search-result > div.biz-listing-large > div.main-attributes > div.media-block.media-block--12 > div.media-story > div.biz-rating > div.i-stars")).should include('4.0','4.5','5.0')
  # end
end

Then(/^Click on any item and expand result$/) do
  @page.find_yelp_element('#super-container > div > div.clearfix.layout-block.layout-a.scroll-map-container.search-results-block > div.column.column-alpha > div > div.search-results-content > ul:nth-child(2) > li:nth-child(1) > div > div.biz-listing-large > div.main-attributes > div > div.media-story > h3 > a > span').click
end

Then(/^Log all the information$/) do
  console.log(@page.find_yelp_element('.map-box-address').text)
  console.log(@page.find_yelp_element('.biz-phone').text)
  console.log(@page.find_yelp_element('.biz-website').text)
  all('.media-story')[0..2].each do |ele|
    console.log ele.text
  end
end
