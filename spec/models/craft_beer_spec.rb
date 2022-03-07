require "rails_helper"

RSpec.describe CraftBeer, type: :model do
  let(:craft_beer) { create(:craft_beer) }
  context "with valid attributes" do
    it "can be created" do
      expect { craft_beer }.to change { CraftBeer.count }.from(0).to(1)
    end
  end

  context "with empty attributes" do
    let!(:craft_beer) { create :craft_beer }
    subject { create :craft_beer, description: nil, price: nil, name: nil }

    it "raises an error" do
      expect { subject }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
