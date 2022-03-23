FactoryBot.define do
  factory :craft_beer do
    association :craft_beer_type
    association :brewery
    name { Faker::Beer.unique.brand }
    price { 2.99 }
    description { "Ein schönes Hochweizen aus der Winter-Saison" }

    trait(:with_all_information) do
      hops { [Hop.new(name: Hop.all.sample)] }
      alcohol_volume { Faker::Beer.alcohol }
      international_bitterness_unit { 58 }
      color { "golden" }
      flavors { [Flavor.new(name: Flavor.all.sample)] }
    end

    trait(:with_image) do
      craft_beer_image { Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/brut-ale.png")) }
    end
  end
end
