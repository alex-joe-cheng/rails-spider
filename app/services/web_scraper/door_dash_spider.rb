# frozen_string_literal: true
# WebScraper::DoorDashSpider.new({}).crawl

module WebScraper
  class DoorDashSpider
    include WebPageHelper

    def initialize(user)
      @user = user
      @session = WebScraper::WebDriver.create_session
      @max_timeout = 10
    end

    def crawl
      log "starting scrape"

      session.visit 'https://www.google.com'

      log session.current_url

      teardown_session
    rescue StandardError => e
      log e

      teardown_session
    end

    private

    attr_reader :user, :session, :max_timeout

    def teardown_session
      session.driver.quit
    end
  end
end
