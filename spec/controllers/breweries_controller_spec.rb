require "rails_helper"

RSpec.describe Api::V1::BreweriesController do
  let!(:brewery) { create :brewery }
  describe "GET Index" do
    it "returns a json array" do
      get :index
      expect(response.content_type).to eq "application/json; charset=utf-8"
      expect(JSON.parse(response.body)).to be_an Array
      expect(JSON.parse(response.body)).to eq(
        [{
          address: brewery.address.to_s,
          description: brewery.description,
          id: brewery.id,
          name: brewery.name,
          ust_id: brewery.ust_id,
          created_at: JSON.parse(response.body)[0]["created_at"],
          updated_at: JSON.parse(response.body)[0]["updated_at"],
          logo: JSON.parse(response.body)[0]["logo"],
        }].as_json,
      )
    end
  end
end
