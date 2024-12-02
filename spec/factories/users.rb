FactoryBot.define do
  factory :user do
    nick_name { Faker::Name.initials(number: 2) }
    last_name            { '山田' }
    first_name           { '太郎' }
    last_name_kana       { 'ヤマダ' }
    first_name_kana      { 'タロウ' }
    email                { Faker::Internet.email }
    password             { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday { Faker::Date.birthday }
  end
end
