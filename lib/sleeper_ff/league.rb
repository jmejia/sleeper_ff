# frozen_string_literal: true

module SleeperFF
  class League
    def initialize(data, client)
      @data = data
      @client = client
    end

    def matchups(week)
      @client.league_matchups(@data.league_id, week)
    end

    def drafts
      @client.league_drafts(@data.league_id)
    end

    def respond_to_missing?(method_name, include_private = false)
      @data.respond_to?(method_name) || super
    end

    def method_missing(method_name, *args, &block)
      if @data.respond_to?(method_name)
        @data.send(method_name, *args, &block)
      else
        super
      end
    end
  end
end
