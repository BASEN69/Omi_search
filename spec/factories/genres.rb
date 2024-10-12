FactoryBot.define do
  factory :genre do
    name { Faker::Address.state }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end