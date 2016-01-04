FactoryGirl.define do
  factory :book do
    title { Faker::Book.title }
    short_description { Faker::Lorem.paragraph }
    full_description { Faker::Lorem.paragraph }
  end
end
