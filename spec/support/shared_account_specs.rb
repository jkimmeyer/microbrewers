RSpec.shared_examples "shared_account_specs" do
  subject { create(described_class.to_s.parameterize.underscore.to_sym, user: user) }

  context "without user" do
    let(:user) { nil }

    it "raises no validation error" do
      expect { subject }.not_to raise_error
    end
  end

  context "with user" do
    let(:user) { create :user }

    it { is_expected.to be_valid }

    it "creates one" do
      expect { subject }.to change { described_class.count }.from(0).to(1)
    end
  end
end
