require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:customer) do
    FactoryBot.create(:customer)
  end
  subject(:order) do
    FactoryBot.create(:order, customer: customer)
  end
  
  it 'is invalid with a price less than 50.000' do
    order.total_price = 50000.0
    order.valid?

    expect(order.valid[:total_price]).to include('must be higher than 50000')
  end

  it 'is invalid without an order date' do
    order = FactoryBot.build(:order, order_date: nil)
    order.valid?
    expect(order.errors[:order_date]).to include("can't be blank")
  end

  it 'is invalid without a total price' do
    order = FactoryBot.build(:order, total_price: nil)
    order.valid?
    expect(order.errors[:total_price]).to include("can't be blank")
  end

  it 'is invalid without a status' do
    order = FactoryBot.build(:order, status: nil)
    order.valid?
    expect(order.errors[:status]).to include("can't be blank")
  end
end
