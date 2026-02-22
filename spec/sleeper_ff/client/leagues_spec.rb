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
        expect(league).to respond_to(:drafts)
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

  describe "#league_traded_picks", :vcr do
    it "returns all traded picks in a league" do
      traded_picks = client.league_traded_picks("957401170459361280")

      expect(traded_picks).to be_an(Array)
      expect(traded_picks.first).to respond_to(:season)
      expect(traded_picks.first).to respond_to(:round)
      expect(traded_picks.first).to respond_to(:roster_id)
      expect(traded_picks.first).to respond_to(:previous_owner_id)
      expect(traded_picks.first).to respond_to(:owner_id)
    end
  end

  describe "#league_transactions", :vcr do
    it "returns transactions for a round" do
      transactions = client.league_transactions("957401170459361280", 1)

      expect(transactions).to be_an(Array)
      expect(transactions.first).to respond_to(:transaction_id)
      expect(transactions.first).to respond_to(:type)
      expect(transactions.first).to respond_to(:status)
      expect(transactions.first).to respond_to(:roster_ids)
    end
  end

  describe "#league_losers_bracket", :vcr do
    it "returns the losers bracket" do
      bracket = client.league_losers_bracket("957401170459361280")

      expect(bracket).to be_an(Array)
      expect(bracket.first).to respond_to(:r)
      expect(bracket.first).to respond_to(:m)
      expect(bracket.first).to respond_to(:t1)
      expect(bracket.first).to respond_to(:t2)
    end
  end

  describe "#league_winners_bracket", :vcr do
    it "returns the winners bracket" do
      bracket = client.league_winners_bracket("957401170459361280")

      expect(bracket).to be_an(Array)
      expect(bracket.first).to respond_to(:r)
      expect(bracket.first).to respond_to(:m)
      expect(bracket.first).to respond_to(:t1)
      expect(bracket.first).to respond_to(:t2)
    end
  end

  describe "#league_matchups", :vcr do
    it "returns matchups for a week" do
      matchups = client.league_matchups("957401170459361280", 1)

      expect(matchups).to be_an(Array)
      expect(matchups.first).to respond_to(:roster_id)
      expect(matchups.first).to respond_to(:matchup_id)
      expect(matchups.first).to respond_to(:points)
      expect(matchups.first).to respond_to(:starters)
    end
  end

  describe "#league_drafts", :vcr do
    it "returns all drafts for a league" do
      drafts = client.league_drafts("957401170459361280")

      expect(drafts).to be_an(Array)
      expect(drafts.first).to respond_to(:draft_id)
      expect(drafts.first).to respond_to(:league_id)
      expect(drafts.first).to respond_to(:status)
      expect(drafts.first).to respond_to(:type)
    end
  end
end
