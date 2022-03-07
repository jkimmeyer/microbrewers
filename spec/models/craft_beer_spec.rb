require "rails_helper"

RSpec.describe CraftBeer, type: :model do
  let(:craft_beer) { create(:craft_beer, :with_all_information) }
  subject { craft_beer }

  context "with valid attributes" do
    it "can be created" do
      expect { subject }.to change { CraftBeer.count }.from(0).to(1)
    end

    context "hops" do
      subject { craft_beer.hops }

      it { is_expected.to be_an Array }
      it { is_expected.to all(be_an Hop) }

      it "can change a hop" do
        craft_beer.update(hops: [Hop.new(name: "Citra")])

        expect(subject).to be_an Array
        expect(subject).to all(be_an Hop)
        expect(subject.size).to eq 1
        expect(subject[0].name).to eq "Citra"
      end

      it "can add a hop" do
        craft_beer.update(hops: subject << Hop.new(name: "Citra"))

        is_expected.to be_an Array
        is_expected.to all(be_an Hop)
        expect(subject.size).to eq 2
      end

      context "when hops are empty" do
        subject { create(:craft_beer).hops }
        it { is_expected.to be_nil }
      end
    end

    context "flavors" do
      subject { craft_beer.flavors }

      it { is_expected.to be_an Array }
      it { is_expected.to all(be_an Flavor) }

      it "can change a flavor" do
        craft_beer.update(flavors: [Flavor.new(name: "würzig")])

        is_expected.to be_an Array
        is_expected.to all(be_an Flavor)
        expect(subject.size).to eq 1
        expect(subject[0].name).to eq "würzig"
      end

      it "can add a flavor" do
        craft_beer.update(flavors: subject << Flavor.new(name: "würzig"))

        is_expected.to be_an Array
        is_expected.to all(be_an Flavor)
        expect(subject.size).to eq 2
      end

      context "when flavors are empty" do
        subject { create(:craft_beer).flavors }

        it { is_expected.to be_nil }
      end
    end
  end

  context "with empty attributes" do
    subject { create :craft_beer, description: nil, price: nil, name: nil }

    it "raises an error" do
      expect { subject }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
