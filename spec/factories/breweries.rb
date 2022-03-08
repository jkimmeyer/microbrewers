FactoryBot.define do
  factory :brewery do
    association :user
    address_data { { street: "Kirchfeldstr.", house_number: 1, city: "Düsseldorf", postal_code: 40_215 } }
  end
end
