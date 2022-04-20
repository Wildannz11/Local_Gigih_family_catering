FactoryBot.define do
  factory :order do
    customer { nil }
    total_price { 50000.0 }
    order_date { "2022-04-20 13:12:04" }
  end
end
