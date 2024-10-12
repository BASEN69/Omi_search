FactoryBot.define do
  factory :post do
    name { Faker::Lorem.characters(number: 10) }
    introduction { Faker::Lorem.characters(number: 30) }
    category { Faker::Lorem.characters(number: 5) }
    address { Faker::Address.full_address }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }

    # アソシエーションを定義（userやgenreが関連付けられている場合）
    association :user
    association :genre
  end
end
