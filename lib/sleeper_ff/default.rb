# frozen_string_literal: true

module SleeperFF
  module Default
    API_ENDPOINT = "https://api.sleeper.app/v1".freeze
    USER_AGENT = "SleeperFF Ruby Gem #{SleeperFF::VERSION}".freeze
    MEDIA_TYPE = "application/json".freeze

    class << self
      def api_endpoint
        API_ENDPOINT
      end

      def user_agent
        USER_AGENT
      end

      def default_media_type
        MEDIA_TYPE
      end
    end
  end
end 