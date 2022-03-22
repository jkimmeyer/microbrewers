require "rails_helper"

RSpec.describe Overrides::RegistrationsController do
  describe "POST create" do
    context "with a brewery" do
      let(:brewery) do
        {
          email: Faker::Internet.unique.email,
          password: Faker::Internet.password(min_length: 8),
          account_type: "Brewery",
          account_attributes: {
            name: Faker::Beer.unique.brand,
            description: Faker::Lorem.paragraph,
          },
        }
      end

      let(:brewery_as_json) do
        { account_type: brewery[:account_type], allow_password_change: false, provider: "email", uid: brewery[:email], email: brewery[:email] }
      end

      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
      end

      it "returns a brewery" do
        post :create, params: brewery
        expect(response.content_type).to eq "application/json; charset=utf-8"
        expect(JSON.parse(response.body)).to be_an Object
        expect(JSON.parse(response.body)["status"]).to eq "success"
        expect(JSON.parse(response.body)["data"].symbolize_keys.except(:created_at, :updated_at, :account_id, :id)).to eq brewery_as_json
      end

      it "creates a brewery and a user" do
        expect { post :create, params: brewery }
          .to change { User.count }.from(0).to(1)
          .and change { Brewery.count }.from(0).to(1)
      end
    end

    # Does not work properly without attributes
    # context "with a customer" do
    #   let(:customer) do
    #     {
    #       email: Faker::Internet.unique.email,
    #       password: Faker::Internet.password(min_length: 8),
    #       account_type: "Customer",
    #       account_attributes: {},
    #     }
    #   end

    #   let(:customer_as_json) do
    #     { account_type: customer[:account_type], allow_password_change: false, provider: "email", uid: customer[:email], email: customer[:email] }
    #   end

    #   before(:each) do
    #     @request.env["devise.mapping"] = Devise.mappings[:user]
    #   end

    #   it "returns a customer" do
    #     post :create, params: customer
    #     expect(response.content_type).to eq "application/json; charset=utf-8"
    #     expect(JSON.parse(response.body)).to be_an Object
    #     expect(JSON.parse(response.body)["status"]).to eq "success"
    #     expect(JSON.parse(response.body)["data"].symbolize_keys.except(:created_at, :updated_at, :account_id, :id)).to eq customer_as_json
    #   end

    #   it "creates a customer and a user" do
    #     expect { post :create, params: customer }
    #       .to change { User.count }.from(0).to(1)
    #       .and change { Customer.count }.from(0).to(1)
    #   end
    # end
  end
end
