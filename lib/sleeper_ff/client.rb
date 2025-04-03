# frozen_string_literal: true

require "sawyer"
require "sleeper_ff/configurable"
require "sleeper_ff/client/users"
require "sleeper_ff/client/leagues"

module SleeperFF
  class Client
    include SleeperFF::Configurable
    include SleeperFF::Client::Users
    include SleeperFF::Client::Leagues

    # Header keys that can be passed in options hash
    CONVENIENCE_HEADERS = Set.new([:accept, :content_type])

    def initialize(options = {})
      SleeperFF::Configurable.keys.each do |key|
        value = options[key].nil? ? SleeperFF::Default.send(key) : options[key]
        instance_variable_set(:"@#{key}", value)
      end
    end

    # Make a HTTP GET request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Query and header params for request
    # @return [Sawyer::Resource]
    def get(url, options = {})
      request :get, url, options
    end

    private

    def request(method, path, data, options = {})
      if data.is_a?(Hash)
        options[:query]   = data.delete(:query) || {}
        options[:headers] = data.delete(:headers) || {}
        if accept = data.delete(:accept)
          options[:headers][:accept] = accept
        end
      end

      @last_response = response = agent.call(method, URI::Parser.new.escape(path.to_s), data, options)
      response.data
    end

    def agent
      @agent ||= Sawyer::Agent.new(api_endpoint) do |http|
        http.headers[:accept] = default_media_type
        http.headers[:user_agent] = user_agent
      end
    end
  end
end 