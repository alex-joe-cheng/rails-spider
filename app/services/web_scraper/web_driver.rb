# frozen_string_literal: true

# owner care_tooling

require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

Capybara.configure do |c|
  c.run_server = false
  c.default_driver = :selenium
end

Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

module WebScraper
  class WebDriver
    def self.create_session
      Capybara::Session.new(:selenium)
    end
  end
end
