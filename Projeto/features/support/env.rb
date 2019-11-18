#require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"

# Capybara::Selenium::Driver.new(app, :browser => :safari)
Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = 'http://localhost:5000'  
end

# desired_caps = Selenium::WebDriver::Remote::Capabilities.safari(
#   )
#   Capybara.register_driver :selenium do |app|
#     Capybara::Selenium::Driver.new(
#       app,
#       browser: :safari,
#       desired_capabilities: desired_caps
#     )
#   end
#   Capybara.default_driver = :selenium

