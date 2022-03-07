FactoryBot.define do
  factory :craft_beer do
    association :craft_beer_type
    name { Faker::Beer.unique.brand }
    price { 2.99 }
    description { "Ein schönes Hochweizen aus der Winter-Saison" }

    trait(:with_all_information) do
      hop { Faker::Beer.hop }
      alcohol_volume { Faker::Beer.alcohol }
      international_bitterness_unit { 58 }
      color { "golden" }
      flavor { "orange, banana, radler" }
    end

    trait(:with_image) do
      craft_beer_image { Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/brut-ale.png")) }
    end
  end
end
