FactoryBot.define do
  factory :item do
    name                 { Faker::Commerce.product_name }
    explain              { Faker::Commerce.department }
    category_id          { Faker::Number.between( from:2, to:4 )}
    status_id            { Faker::Number.between( from:2, to:4 )}
    shippingfee_payer_id { Faker::Number.between( from:2, to:4 )}
    prefecture_id        { Faker::Number.between( from:2, to:40 )}
    shipping_day_id      { Faker::Number.between( from:2, to:4 )}
    price                { Faker::Number.between( from:300, to:9999999 )}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/ranger.jpeg'), filename: 'test_image.jpeg')
    end

    association :user
  end
end