FactoryBot.define do
  factory :item do
    title { 'test' }
    description { Faker::Lorem.sentence }
    price { Faker::Number.within(range: 300..9_999_999) }
    category_id { 5 }
    condition_id { 2 }
    shipping_charge_id { 2 }
    area_id { 40 }
    shipping_date_id { 2 }
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
