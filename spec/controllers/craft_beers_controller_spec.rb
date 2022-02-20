require "rails_helper"

RSpec.describe Api::V1::CraftBeersController do
  describe "POST create" do
    context "with valid attributes" do
      let(:craft_beer_type) { create :craft_beer_type }
      let(:craft_beer) do
        { craft_beer: { name: "Holunder-Bier", craft_beer_type_id: craft_beer_type.id } }
      end

      it "returns a json object" do
        post :create, params: craft_beer
        expect(response.content_type).to eq "application/json; charset=utf-8"
      end

      it "creates a craft beer" do
        expect { post :create, params: craft_beer }.to change { CraftBeer.count }.from(0).to(1)
      end
    end

    context "with invalid attributes" do
      let(:invalid_craft_beer) do
        { craft_beer: { name: "Holunder-Bier" } }
      end

      it "returns errors" do
        post :create, params: invalid_craft_beer
        expect(response.body).to eq({ errors: { craft_beer_type: ["must exist"] } }.to_json)
      end

      it "creates no beer" do
        expect { post :create, params: invalid_craft_beer }.not_to(change { CraftBeer.count })
      end

      it "returns json" do
        post :create, params: invalid_craft_beer

        expect(response.content_type).to eq "application/json; charset=utf-8"
      end
    end
  end

  describe "GET index" do
    let!(:craft_beers) { create_list(:craft_beer, 2) }

    it "returns a json array" do
      get :index
      expect(response.content_type).to eq "application/json; charset=utf-8"
      expect(JSON.parse(response.body)).to be_an Array
    end

    it "returns two craft beers" do
      get :index
      expect(JSON.parse(response.body).size).to eq 2
      expect(response.body).to eq craft_beers.to_json
    end
  end
end
