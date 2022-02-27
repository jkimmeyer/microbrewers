require "rails_helper"

RSpec.describe Api::V1::CraftBeersController do
  describe "POST /api/v1/craft_beers/create" do
    context "with valid attributes" do
      subject { post :create, params: craft_beer }

      let(:craft_beer_type) { create :craft_beer_type }
      let(:craft_beer) do
        { craft_beer: { name: "Holunder-Bier", craft_beer_type_id: craft_beer_type.id, craft_beer_image: craft_beer_image } }
      end

      let(:craft_beer_image) { fixture_file_upload("brut-ale.png") }

      it "returns a JSON response" do
        subject
        expect(response.content_type).to eq "application/json; charset=utf-8"
      end

      it "creates a craft beer" do
        expect { subject }.to change { CraftBeer.count }.from(0).to(1)
      end

      it "creates a blob " do
        expect { subject }.to change { ActiveStorage::Blob.count }.from(0).to(1)
      end
    end

    context "with invalid attributes" do
      subject { post :create, params: invalid_craft_beer }

      let(:invalid_craft_beer) do
        { craft_beer: { name: "Holunder-Bier" } }
      end

      it "returns errors" do
        subject
        expect(response.body).to eq({ errors: { craft_beer_type: ["must exist"] } }.to_json)
      end

      it "creates no beer" do
        expect { subject }.not_to(change { CraftBeer.count })
      end

      it "returns json" do
        subject

        expect(response.content_type).to eq "application/json; charset=utf-8"
      end

      it "does not create a blob" do
        expect { subject }.not_to change { ActiveStorage::Blob.count }.from(0)
      end
    end
  end

  describe "GET /api/v1/craft_beers" do
    subject { get :index }

    context "without attachment" do
      let!(:craft_beers) { create_list(:craft_beer, 2) }

      it "returns a json array" do
        subject
        expect(response.content_type).to eq "application/json; charset=utf-8"
        expect(JSON.parse(response.body)).to be_an Array
      end

      it "returns two craft beers" do
        subject
        expect(JSON.parse(response.body).size).to eq 2
        expect(response.body).to eq(craft_beers.map { |craft_beer| craft_beer.attributes.merge(image_url: nil) }.to_json)
      end
    end

    context "with attachment" do
      let!(:craft_beer) { create(:craft_beer, :with_image) }

      it "contains an attachment url" do
        subject
        expect(JSON.parse(response.body)[0]["image_url"]).not_to be nil
      end
    end
  end
end
