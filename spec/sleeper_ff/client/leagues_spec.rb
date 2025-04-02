# frozen_string_literal: true

RSpec.describe SleeperFF::Client::Leagues do
  let(:client) { SleeperFF.new }

  describe "#user_leagues", :vcr do
    context "when fetching leagues for a user" do
      it "returns leagues for a specific season" do
        leagues = client.user_leagues("782008200219205632", 2024)

        expect(leagues).to be_an(Array)
        expect(leagues.first).to respond_to(:league_id)
        expect(leagues.first).to respond_to(:name)
        expect(leagues.first).to respond_to(:season)
      end
    end
  end

  describe "#league", :vcr do
    context "when the league exists" do
      it "returns league information" do
        league = client.league("957401170459361280")

        expect(league).not_to be_nil
        expect(league.league_id).to eq("957401170459361280")
        expect(league).to respond_to(:name)
        expect(league).to respond_to(:season)
        expect(league).to respond_to(:settings)
      end
    end

    context "when the league doesn't exist" do
      it "returns nil" do
        result = client.league("definitely_not_a_real_league_123456789")
        expect(result).to eq(nil)
      end
    end
  end

  describe "#league_rosters", :vcr do
    it "returns all rosters for a league" do
      rosters = client.league_rosters("957401170459361280")

      expect(rosters).to be_an(Array)
      expect(rosters.first).to respond_to(:roster_id)
      expect(rosters.first).to respond_to(:owner_id)
      expect(rosters.first).to respond_to(:players)
    end
  end

  describe "#league_users", :vcr do
    it "returns all users in a league" do
      users = client.league_users("957401170459361280")

      expect(users).to be_an(Array)
      expect(users.first).to respond_to(:user_id)
      expect(users.first).to respond_to(:display_name)
    end
  end
end 