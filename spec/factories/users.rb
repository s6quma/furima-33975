FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    first_name            { '日本語姓' }
    last_name             { '日本語名' }
    first_name_kana       { 'カナショウ' }
    last_name_kana        { 'カナメイ' }
    birthday              { 0o000 - 0o0 - 0o0 }
  end
end
