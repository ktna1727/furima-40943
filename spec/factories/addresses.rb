FactoryBot.define do
  factory :address do
    post_number { '123-4567' }
    municipalities { '横浜市緑区' }
    street_address { '青山1-1-1' }
    phone_number { '09212345678' }
    area_id { 2 }
    association :order
  end
end
