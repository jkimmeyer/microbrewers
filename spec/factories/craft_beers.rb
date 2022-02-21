FactoryBot.define do
  factory :craft_beer do
    association :craft_beer_type
    name { "MyString" }

    trait(:with_all_information) do
      price { 2.99 }
      description { "Ein schönes Hochweizen aus der Winter-Saison" }
      hop { "Citra, Hallertauer" }
      alcohol_volume { 6.50 }
      international_bitterness_unit { 58 }
      color { "golden" }
      flavor { "orange, banana, radler" }
    end
  end
end
