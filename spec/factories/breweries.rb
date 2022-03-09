FactoryBot.define do
  factory :brewery do
    association :user
    name { Faker::Beer.unique.brand }
    description { Faker::Lorem.paragraph(sentence_count: 5) }
    logo { Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/baltic-brewery-logo.png")) }
    ust_id { Faker::Code.nric }
    address_data { { street: Faker::Address.street_name, house_number: Faker::Address.building_number, city: Faker::Address.city, postal_code: Faker::Address.zip } }
  end
end
