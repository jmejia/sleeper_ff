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
    end
  end
end