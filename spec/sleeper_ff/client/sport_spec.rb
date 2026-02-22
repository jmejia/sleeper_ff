# frozen_string_literal: true

RSpec.describe SleeperFF::Client::Sport do
  let(:client) { SleeperFF.new }

  describe "#nfl_state", :vcr do
    it "returns the current nfl state" do
      state = client.nfl_state

      expect(state).not_to be_nil
      expect(state).to respond_to(:week)
      expect(state).to respond_to(:season)
      expect(state).to respond_to(:season_type)
    end
  end
end
