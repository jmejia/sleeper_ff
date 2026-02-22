# frozen_string_literal: true

module SleeperFF
  class Draft
    def initialize(data, client)
      @data = data
      @client = client
    end

    def picks
      @client.draft_picks(@data.draft_id)
    end

    def traded_picks
      @client.draft_traded_picks(@data.draft_id)
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
