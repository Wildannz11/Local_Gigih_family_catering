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

    expect(order.valid[:total_price]).to include('must be higher or equal than 50000')
  end
end
