require "rails_helper"

RSpec.describe "db/seeds.rb" do
  it "can be loaded" do
    expect { Rails.application.load_seed }.not_to raise_error
  end
end
