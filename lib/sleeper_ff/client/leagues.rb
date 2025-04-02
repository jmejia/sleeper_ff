# frozen_string_literal: true

module SleeperFF
  class Client
    module Leagues
      # Get all leagues for a user in a season
      #
      # @param username [String] Username of the Sleeper user
      # @param season [Integer] NFL season year (e.g., 2023)
      # @return [Array<Sawyer::Resource>] Array of league information
      def user_leagues(username, season)
        get "user/#{username}/leagues/nfl/#{season}"
      end

      # Get a specific league
      #
      # @param league_id [String] League ID
      # @return [Sawyer::Resource] League information
      def league(league_id)
        get "league/#{league_id}"
      end

      # Get all rosters in a league
      #
      # @param league_id [String] League ID
      # @return [Array<Sawyer::Resource>] Array of roster information
      def league_rosters(league_id)
        get "league/#{league_id}/rosters"
      end

      # Get all users in a league
      #
      # @param league_id [String] League ID
      # @return [Array<Sawyer::Resource>] Array of user information
      def league_users(league_id)
        get "league/#{league_id}/users"
      end
    end
  end
end 