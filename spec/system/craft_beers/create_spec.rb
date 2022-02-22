require "rails_helper"

RSpec.describe "Create Craft Beer", js: true do
  let!(:craft_beer_types) { create :craft_beer_type }

  it "renders a craft beer form" do
    visit "/#/craft_beers/new"
    expect(page).to have_content "Add a new craft beer"
    expect(page).to have_field("Name", with: "")
    expect(page).to have_field("Hops", with: "")
    expect(page).to have_field("Description", with: "")
  end

  it "shows all craft_beer_types" do
    visit "/#/craft_beers/new"
  end

  context "with a valid craft beer" do
    let(:craft_beer) { build :craft_beer, :with_all_information }

    it "creates a craft beer successfully" do
      visit "/#/craft_beers/new"
      fill_in "input-name", with: craft_beer.name
      fill_in "input-description", with: craft_beer.description
      fill_in "input-hops", with: craft_beer.hop
      fill_in "input-ibu", with: craft_beer.international_bitterness_unit
      fill_in "input-vol", with: craft_beer.alcohol_volume
      fill_in "input-price", with: craft_beer.price
      fill_in "input-flavor", with: craft_beer.flavor
      fill_in "input-color", with: craft_beer.color
      select "MyString", from: "Craft Beer Type"
      expect { click_on "Craft Bier hinzufügen" }.to change { CraftBeer.count }.from(0).to(1)
      expect(CraftBeer.find_by(name: craft_beer.name).attributes).to include craft_beer.attributes.without("id", "craft_beer_type_id", "created_at", "updated_at")
    end
  end

  context "with an invalid craft beer" do
    let(:invalid_craft_beer) { build :craft_beer, craft_beer_type: nil }

    it "shows errors when the craft beer is invalid" do
      visit "/#/craft_beers/new"
      fill_in "input-name", with: invalid_craft_beer.name
      fill_in "input-description", with: invalid_craft_beer.description
      fill_in "input-hops", with: invalid_craft_beer.hop
      fill_in "input-ibu", with: invalid_craft_beer.international_bitterness_unit
      fill_in "input-vol", with: invalid_craft_beer.alcohol_volume
      fill_in "input-price", with: invalid_craft_beer.price
      fill_in "input-flavor", with: invalid_craft_beer.flavor
      fill_in "input-color", with: invalid_craft_beer.color
      expect { click_on "Craft Bier hinzufügen" }.not_to(change { CraftBeer.count })
    end
  end
end