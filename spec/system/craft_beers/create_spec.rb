require "rails_helper"

RSpec.describe "Create Craft Beer", js: true do
  let!(:craft_beer_types) { create :craft_beer_type }

  it "renders a craft beer form" do
    visit "/#/craft_beers/new"
    expect(page).to have_content "Erstelle ein neues Craft Bier!"
    expect(page).to have_field("Name", with: "")
    expect(page).to have_field("Hopfen", with: "")
    expect(page).to have_field("Beschreibung", with: "")
  end

  it "shows all craft_beer_types" do
    visit "/#/craft_beers/new"
    expect(page).to have_select("Kategorie", options: [craft_beer_types.name])
  end

  context "with a valid craft beer" do
    subject { click_on("Craft Bier hinzufügen") }
    let(:craft_beer) { build :craft_beer, :with_all_information }

    it "creates a craft beer successfully" do
      visit "/#/craft_beers/new"
      fill_in "input-name", with: craft_beer.name
      attach_file("input-craft-beer-image", Rails.root.join("spec/fixtures/files/brut-ale.png"))
      fill_in "input-description", with: craft_beer.description
      fill_in "input-hops", with: craft_beer.hop
      fill_in "input-ibu", with: craft_beer.international_bitterness_unit
      fill_in "input-vol", with: craft_beer.alcohol_volume
      fill_in "input-price", with: craft_beer.price
      fill_in "input-flavor", with: craft_beer.flavor
      fill_in "input-color", with: craft_beer.color
      select "MyString", from: "Kategorie"

      expect { subject }.to change { CraftBeer.count }.from(0).to(1)
        .and change { ActiveStorage::Blob.count }.from(0).to(1)
      expect(CraftBeer.find_by(name: craft_beer.name).attributes).to include craft_beer.attributes.without("id", "craft_beer_type_id", "created_at", "updated_at")

      visit "/#/craft_beers"
      expect(page).to have_content craft_beer.name
    end
  end

  context "with an invalid craft beer" do
    subject { click_on("Craft Bier hinzufügen") }
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

      expect { subject }.to change { CraftBeer.count }.by(0)
        .and change { ActiveStorage::Blob.count }.by(0)
    end
  end
end
