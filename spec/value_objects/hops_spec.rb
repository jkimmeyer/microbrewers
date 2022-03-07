require "rails_helper"

RSpec.describe Hop do
  context "with valid name" do
    subject { Hop.new(name: Hop.all.first) }

    it "initializes a hop object" do
      expect(subject).to be_an Hop
    end
  end

  context "with invalid name" do
    subject { Hop.new(name: "Invalid Name") }

    it "raises an standard error" do
      expect { subject }.to raise_error StandardError, "Hop Invalid Name does not exist."
    end
  end
end
