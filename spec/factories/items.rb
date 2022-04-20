FactoryBot.define do
  factory :item do
    name { Faker::Food.dish }
    price { Faker::Number.positive }
    # category { Category.new(name: "makanan barat") || association(:category) }  # ref: https://qiita.com/Kolosek/items/7c85337f928161e0e76e
    category { Category.first || association(:category) }  # ref: https://qiita.com/Kolosek/items/7c85337f928161e0e76e
  end

  factory :invalid_item, parent: :item do
    name { nil }
    price { 10000.0 }
    category { nil }
  end
end
