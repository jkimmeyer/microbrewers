require "rails_helper"

RSpec.describe User, type: :model do
  subject { create(:user) }

  let(:props) { nil }

  context "without account" do
    it { is_expected.to be_valid }

    it "creates one user" do
      expect { subject }.to change { User.count }.from(0).to(1)
    end
  end
end
