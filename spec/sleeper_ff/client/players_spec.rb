# frozen_string_literal: true

RSpec.describe SleeperFF::Client::Players do
  let(:client) { SleeperFF.new }

  describe "#trending_players", :vcr do
    it "returns trending players by add activity" do
      players = client.trending_players("add")

      expect(players).to be_an(Array)
      expect(players.first).to respond_to(:player_id)
      expect(players.first).to respond_to(:count)
    end
  end
end
