# frozen_string_literal: true

RSpec.describe SleeperFF::Client::Drafts do
  let(:client) { SleeperFF.new }

  describe "#user_drafts", :vcr do
    it "returns all drafts for a user" do
      drafts = client.user_drafts("782008200219205632", 2023)

      expect(drafts).to be_an(Array)
      expect(drafts.first).to be_a(SleeperFF::Draft)
      expect(drafts.first).to respond_to(:draft_id)
      expect(drafts.first).to respond_to(:league_id)
      expect(drafts.first).to respond_to(:status)
      expect(drafts.first).to respond_to(:picks)
      expect(drafts.first).to respond_to(:traded_picks)
    end
  end

  describe "#draft", :vcr do
    it "returns draft information" do
      draft = client.draft("957401170459361281")

      expect(draft).to be_a(SleeperFF::Draft)
      expect(draft.draft_id).to eq("957401170459361281")
      expect(draft).to respond_to(:type)
      expect(draft).to respond_to(:status)
      expect(draft).to respond_to(:season)
      expect(draft).to respond_to(:picks)
      expect(draft).to respond_to(:traded_picks)
    end
  end

  describe "#draft_picks", :vcr do
    it "returns all picks for a draft" do
      picks = client.draft_picks("957401170459361281")

      expect(picks).to be_an(Array)
      expect(picks.first).to respond_to(:player_id)
      expect(picks.first).to respond_to(:picked_by)
      expect(picks.first).to respond_to(:round)
      expect(picks.first).to respond_to(:pick_no)
    end
  end

  describe "#draft_traded_picks", :vcr do
    it "returns all traded picks for a draft" do
      traded_picks = client.draft_traded_picks("957401170459361281")

      expect(traded_picks).to be_an(Array)
      expect(traded_picks.first).to respond_to(:season)
      expect(traded_picks.first).to respond_to(:round)
      expect(traded_picks.first).to respond_to(:roster_id)
      expect(traded_picks.first).to respond_to(:previous_owner_id)
      expect(traded_picks.first).to respond_to(:owner_id)
    end
  end
end
