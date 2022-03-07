require "rails_helper"

RSpec.describe Flavor do
  context "with valid name" do
    subject { Flavor.new(name: Flavor.all.first) }

    it "initializes a flavor object" do
      expect(subject).to be_an Flavor
    end
  end

  context "with invalid name" do
    subject { Flavor.new(name: "Invalid Name") }

    it "raises an standard error" do
      expect { subject }.to raise_error StandardError, "Flavor Invalid Name does not exist."
    end
  end
end
