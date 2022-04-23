require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:category) do
    # Category.new(name: "makanan padang")
    FactoryBot.create(:category)
  end
  subject(:item) do
    FactoryBot.create(:item)
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:item)).to be_valid
  end

  it 'is valid with a name ' do
    expect(item).to be_valid
  end

  it 'is invalid without a name' do
    item.name = nil
    item.valid?
    expect(item.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a blank name' do
    item.name = ''
    item.valid?
    expect(item.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a price' do
    item = FactoryBot.build(:item, price: nil)
    item.valid?
    expect(item.errors[:price]).to include("can't be blank")
  end

  it 'is invalid with a duplicate name' do
    item1 = FactoryBot.create(:item, name: 'Nasi Uduk')
    item2 = FactoryBot.build(:item, name: 'Nasi Uduk')

    item2.valid?

    expect(item2.errors[:name]).to include('has already been taken')
  end

  it 'is invalid with a non-integer price' do
    item.price = 'test_price'
    item.valid?

    expect(item.errors[:price]).to include('is not a number')
  end

  it 'is invalid with a price less than 0.01' do
    item.price = -5000.0
    item.valid?

    expect(item.errors[:price]).to include('must be greater than 0.01')
  end

  it 'is invalid with a more than 150 characters for description' do
    item = FactoryBot.build(:item, description: "deskripsi" * 17)
    item.valid?
    expect(item.errors[:description]).to include('is too long (maximum is 150 characters)')
  end
end
