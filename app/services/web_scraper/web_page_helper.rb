# frozen_string_literal: true

module WebScraper
  module WebPageHelper
    def log(message, level = :info)
      Rails.logger.tagged(self.class.name) do
        Rails.logger.send(level, message)
      end
    end
  end
end
