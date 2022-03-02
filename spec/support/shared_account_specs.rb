RSpec.shared_examples "shared_account_specs" do
  subject { described_class.create(props) }

  context "without user" do
    let(:props) { nil }

    it { is_expected.to_not be_valid }

    it "has one error" do
      expect(subject.errors.size).to eq 1
    end

    it "complains about user association" do
      expect(subject.errors.messages[:user]).to eq ["must exist"]
    end
  end

  context "with user" do
    let(:user) { create :user }
    let(:props) { { user: user } }

    it { is_expected.to be_valid }

    it "creates one" do
      expect { subject }.to change { described_class.count }.from(0).to(1)
    end
  end
end
