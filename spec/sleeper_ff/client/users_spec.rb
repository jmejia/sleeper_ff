# frozen_string_literal: true

RSpec.describe SleeperFF::Client::Users do
  let(:client) { SleeperFF.new }

  describe "#user", :vcr do
    context "when the user exists" do
      it "returns the user information" do
        user = client.user("sparlock")

        expect(user).not_to be_nil
        expect(user.username).to eq("sparlock")
        expect(user.user_id).to eq("782008200219205632")
        expect(user.display_name).to eq("sparlock")
        expect(user.avatar).to be_a(String)
      end
    end

    context "when the user doesn't exist" do
      it "returns nil" do
        result = client.user("definitely_not_a_real_user_123456789")

        expect(result).to eq(nil)
      end
    end
  end
end 