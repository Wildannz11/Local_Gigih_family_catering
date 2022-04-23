FactoryBot.define do
  factory :cart do
    item { nil }
    order { nil }
    price { 1.5 }
    quantity { 1 }
    subtotal_price { 1.5 }
  end
end
