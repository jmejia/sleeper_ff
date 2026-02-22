# frozen_string_literal: true

require "sleeper_ff/draft"

module SleeperFF
  class Client
    module Drafts
      # Get all drafts for a user in a season
      #
      # @param user_id [String] User ID
      # @param season [Integer] NFL season year (e.g., 2023)
      # @return [Array<SleeperFF::Draft>] Array of draft objects
      def user_drafts(user_id, season)
        data = get "user/#{user_id}/drafts/nfl/#{season}"
        return [] if data.nil?

        data.map { |d| SleeperFF::Draft.new(d, self) }
      end

      # Get a specific draft
      #
      # @param draft_id [String] Draft ID
      # @return [SleeperFF::Draft] Draft object
      def draft(draft_id)
        data = get "draft/#{draft_id}"
        return nil if data.nil?

        SleeperFF::Draft.new(data, self)
      end

      # Get all picks in a draft
      #
      # @param draft_id [String] Draft ID
      # @return [Array<Sawyer::Resource>] Array of pick objects
      def draft_picks(draft_id)
        get "draft/#{draft_id}/picks"
      end

      # Get all traded picks in a draft
      #
      # @param draft_id [String] Draft ID
      # @return [Array<Sawyer::Resource>] Array of traded pick objects
      def draft_traded_picks(draft_id)
        get "draft/#{draft_id}/traded_picks"
      end
    end
  end
end
