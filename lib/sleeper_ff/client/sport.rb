# frozen_string_literal: true

module SleeperFF
  class Client
    module Sport
      # Get the current state of an NFL season
      #
      # @return [Sawyer::Resource] Current NFL state including week, season, and season type
      def nfl_state
        get "state/nfl"
      end
    end
  end
end
