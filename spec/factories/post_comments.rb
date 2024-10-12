FactoryBot.define do
  factory :post_comment do
    comment {Faker::Lorem.characters(number: 15) }
    association :user
    association :post
  end
end