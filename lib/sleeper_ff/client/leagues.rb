# frozen_string_literal: true

require "sleeper_ff/league"
require "sleeper_ff/draft"

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
      # @return [SleeperFF::League] League object
      def league(league_id)
        data = get "league/#{league_id}"
        return nil if data.nil?

        SleeperFF::League.new(data, self)
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

      # Get transactions for a specific round (week) in a league
      #
      # @param league_id [String] League ID
      # @param round [Integer] Week/round number
      # @return [Array<Sawyer::Resource>] Array of transaction objects
      def league_transactions(league_id, round)
        get "league/#{league_id}/transactions/#{round}"
      end

      # Get all traded picks in a league
      #
      # @param league_id [String] League ID
      # @return [Array<Sawyer::Resource>] Array of traded pick objects
      def league_traded_picks(league_id)
        get "league/#{league_id}/traded_picks"
      end

      # Get the winners playoff bracket for a league
      #
      # @param league_id [String] League ID
      # @return [Array<Sawyer::Resource>] Array of bracket matchup objects
      def league_winners_bracket(league_id)
        get "league/#{league_id}/winners_bracket"
      end

      # Get the losers playoff bracket for a league
      #
      # @param league_id [String] League ID
      # @return [Array<Sawyer::Resource>] Array of bracket matchup objects
      def league_losers_bracket(league_id)
        get "league/#{league_id}/losers_bracket"
      end

      # Get matchups for a specific week in a league
      #
      # @param league_id [String] League ID
      # @param week [Integer] Week number
      # @return [Array<Sawyer::Resource>] Array of matchup objects
      def league_matchups(league_id, week)
        get "league/#{league_id}/matchups/#{week}"
      end

      # Get all drafts for a league
      #
      # @param league_id [String] League ID
      # @return [Array<SleeperFF::Draft>] Array of draft objects
      def league_drafts(league_id)
        data = get "league/#{league_id}/drafts"
        return [] if data.nil?

        data.map { |d| SleeperFF::Draft.new(d, self) }
      end
    end
  end
end
