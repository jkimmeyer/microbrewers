FactoryBot.define do
  factory :craft_beer_type do
    name { Faker::Beer.style }
  end
end
