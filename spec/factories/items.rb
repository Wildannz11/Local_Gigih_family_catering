FactoryBot.define do
  factory :item do
    name { Faker::Food.dish }
    price { Faker::Number.positive }
    description { Faker::Food.description }
    # ref: https://qiita.com/Kolosek/items/7c85337f928161e0e76e
    # ref: https://qiita.com/Kolosek/items/7c85337f928161e0e76e
  end

  factory :invalid_item, parent: :item do
    name { nil }
    price { 0 }
    description { nil }
  end
end
