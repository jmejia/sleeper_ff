# frozen_string_literal: true

module SleeperFF
  module Configurable
    attr_accessor :api_endpoint, :user_agent, :default_media_type

    class << self
      def keys
        @keys ||= [
          :api_endpoint,
          :user_agent,
          :default_media_type
        ]
      end
    end

    def configure
      yield self
    end

    private

    def reset!
      SleeperFF::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", SleeperFF::Default.send(key))
      end
      self
    end
  end
end 