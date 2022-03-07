require "rails_helper"

RSpec.describe CraftBeerType, type: :model do
  let(:craft_beer_type) { create(:craft_beer_type) }
  context "with valid attributes" do
    it "can be created" do
      expect { craft_beer_type }.to change { CraftBeerType.count }.from(0).to(1)
    end
  end

  context "with invalid attributes" do
    let!(:craft_beer_type) { create(:craft_beer_type) }
    subject { build(:craft_beer_type, name: craft_beer_type.name) }

    it { is_expected.to be_invalid }

    it "raises an uniqueness error" do
      subject.save
      expect(subject.errors.messages[:name]).to eq ["has already been taken"]
    end
  end
end
