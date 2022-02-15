require "rails_helper"

RSpec.describe CraftBeerType, type: :model do
  let(:craft_beer_type) { create(:craft_beer_type) }
  context "with valid attributes" do
    it "can be created" do
      expect { craft_beer_type }.to change { CraftBeerType.count }.from(0).to(1)
    end
  end
end
