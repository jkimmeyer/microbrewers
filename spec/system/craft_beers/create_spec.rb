require "rails_helper"

RSpec.describe "Create Craft Beer", js: true do
  it "renders a craft beer form" do
    visit "/#/craft_beers/new"
    expect(page).to have_content "Add a new craft beer"
  end
end
