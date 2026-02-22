# frozen_string_literal: true

module SleeperFF
  class Client
    module Players
      # Get all NFL players
      #
      # @return [Hash] Hash of player information keyed by player ID
      def players
        get "players/nfl"
      end

      # Get trending NFL players by add or drop activity
      #
      # @param type [String] "add" or "drop"
      # @param lookback_hours [Integer] Hours to look back (default 24)
      # @param limit [Integer] Number of results to return (default 25)
      # @return [Array<Sawyer::Resource>] Array of trending player objects
      def trending_players(type, lookback_hours: 24, limit: 25)
        get "players/nfl/trending/#{type}", query: {lookback_hours: lookback_hours, limit: limit}
      end
    end
  end
end
