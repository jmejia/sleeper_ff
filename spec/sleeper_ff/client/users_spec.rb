# frozen_string_literal: true

RSpec.describe SleeperFF::Client::Users do
  let(:client) { SleeperFF.new }

  describe "#user", :vcr do
    context "when the user exists" do
      it "returns the user information" do
        user = client.user("sparlock")

        expect(user).not_to be_nil
        expect(user.username).to eq("sparlock")
      end
    end

    context "when the user doesn't exist" do
      it "returns nil" do
        not_a_user = client.user("definitely_not_a_real_user_123456789")

        expect(not_a_user).to eq(nil)
      end
    end
  end
end 