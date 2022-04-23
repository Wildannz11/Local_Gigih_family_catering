FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number_with_country_code }
    address { Faker::Address.full_address }
  end

  factory :invalid_customer, parent: :customer do
    name { nil }
    email { nil }
    phone { nil }
    address { nil }
  end
end
