FactoryBot.define do
  factory :order_detail do
    order { nil }
    item { nil }
    quantity { 1 }
    item_price { 1.5 }
  end
end
