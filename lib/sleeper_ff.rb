# frozen_string_literal: true

require "sleeper_ff/version"
require "sleeper_ff/client"
require "sleeper_ff/default"
require "sleeper_ff/error"

module SleeperFF
  class Error < StandardError; end

  # Return a new SleeperFF::Client instance
  #
  # @return [SleeperFF::Client]
  def self.new(options = {})
    SleeperFF::Client.new(options)
  end

  # Delegate to SleeperFF::Client.new
  #
  # @return [SleeperFF::Client]
  def self.client(options = {})
    SleeperFF::Client.new(options)
  end
end
