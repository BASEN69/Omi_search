FactoryBot.define do
  
  alice = FactoryBot.create(:user)
  
  factory :post do
    name { Faker::Lorem.characters(number:10) }
    introduction { Faker::Lorem.characters(number:30) }
    category { Faker::Lorem.characters(number:5) }
    user_id { Faker::Lorem.characters(number:10) }
    genre_id { Faker::Lorem.characters(number:47) }
    address { Faker::Lorem.characters(number:30) }
    latitude { Faker::Lorem.characters(number:30) }
    longitude { Faker::Lorem.characters(number:30) }
  end
end