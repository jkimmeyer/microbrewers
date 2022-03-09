require "rails_helper"

RSpec.describe Brewery, type: :model do
  it_behaves_like "shared_account_specs"

  let(:brewery) { create :brewery }

  context "address" do
    subject { brewery.address }

    it { is_expected.to be_an Address }

    it "can change an address" do
      brewery.update(address: Address.new(street: "Kirchfeldstraße", house_number: "1", city: "Düsseldorf", postal_code: 40_215))

      is_expected.to be_an Address

      expect(subject.to_s).to eq "Kirchfeldstraße 1, 40215 Düsseldorf"
    end

    context "when address is empty" do
      let(:brewery) { create :brewery, address_data: nil }
      subject { brewery.address }

      it { is_expected.to be_nil }
    end
  end
end
