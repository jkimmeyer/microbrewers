require "rails_helper"

RSpec.describe Address do
  context "with valid attributes" do
    subject { Address.new(street: "Kirchfeldstraße", house_number: "1", postal_code: "40215", city: "Düsseldorf") }

    it { is_expected.to be_an Address }
    it { is_expected.to be_valid }

    it "can parse an address string" do
      expect(subject.to_s).to eq "Kirchfeldstraße 1, 40215 Düsseldorf"
    end

    context "with country" do
      subject { Address.new(street: "Kirchfeldstraße", house_number: "1", postal_code: "40215", city: "Düsseldorf", country: "Deutschland") }

      it "can parse an address string" do
        expect(subject.to_s).to eq "Kirchfeldstraße 1, 40215 Düsseldorf, Deutschland"
      end
    end
  end

  context "with missing arguments" do
    subject { Address.new(street: "Kirchfeldstraße", house_number: "1", postal_code: "40215") }

    it "raises an error" do
      expect { subject }.to raise_error ArgumentError
    end
  end

  context "with invalid attributes" do
    subject { Address.new(street: "Kirchfeldstraße", house_number: "1", postal_code: "40215", city: nil) }

    it "raises an validation error" do
      expect(subject).to be_invalid
    end
  end
end
