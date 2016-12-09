require 'capybara/cucumber'
require 'rspec/expectations'

# Capybara.default_driver = :selenium  #disable default firefox

Capybara.app_host = "https://trello.com"
Capybara.run_server = true
Capybara.default_wait_time = 5