FactoryBot.define do
  factory :craft_beer do
    association :craft_beer_type
    name { "MyString" }
  end
end
