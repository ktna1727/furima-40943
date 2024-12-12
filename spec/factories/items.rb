FactoryBot.define do
  factory :item do
    item_name { '商品名' }
    description                { '商品の説明です。' }
    price                      { 500 }
    category_id                { 2 }
    condition_id               { 2 }
    shipping_cost_responsibility_id { 2 }
    area_id                    { 2 }
    estimated_shipping_date_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
