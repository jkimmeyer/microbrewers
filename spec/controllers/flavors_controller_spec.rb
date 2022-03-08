require "rails_helper"

RSpec.describe Api::V1::FlavorsController do
  describe "GET Index" do
    it "returns a json array" do
      get :index
      expect(response.content_type).to eq "application/json; charset=utf-8"
      expect(JSON.parse(response.body)).to be_an Array
    end
  end
end
