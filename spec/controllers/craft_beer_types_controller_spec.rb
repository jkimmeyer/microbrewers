require "rails_helper"

RSpec.describe Api::V1::CraftBeerTypesController do
  describe "GET Index" do
    let!(:craft_beer_types) { create_list(:craft_beer_type, 2) }

    it "returns a json array" do
      get :index
      expect(response.content_type).to eq "application/json; charset=utf-8"
      expect(JSON.parse(response.body)).to be_an Array
    end

    it "returns two craft beer types" do
      get :index
      expect(JSON.parse(response.body).size).to eq 2
      expect(response.body).to eq craft_beer_types.to_json
    end
  end
end
