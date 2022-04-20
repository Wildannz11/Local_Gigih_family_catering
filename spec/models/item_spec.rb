require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:category) do
    # Category.new(name: "makanan padang")
    FactoryBot.create(:category)
  end
  subject(:item) do
    FactoryBot.create(:item, category: category)
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:item)).to be_valid
  end

  it 'is valid with a name ' do
    expect(item).to be_valid
  end

  it 'is invalid without a category' do
    item.category = nil
    item.valid?
    expect(item.errors[:category]).to include('must exist')
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

  it 'is invalid with a duplicate name' do
    FactoryBot.create(:item, name: 'Nasi Uduk')
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

  describe 'self#by_letter' do
    it 'should return a sorted array of results that match' do
      item1 = FactoryBot.create(:item, name: 'Nasi Uduk')

      item2 = FactoryBot.create(:item, name: 'Kerak Telor')

      item3 = FactoryBot.create(:item, name: 'Nasi Semur Jengkol')

      expect(item.by_letter('N')).to eq([item3, item1])
    end
  end

  describe 'self#by_category' do
    it 'should return items that has the category' do
      new_category = FactoryBot.build(:category, name: 'test_test')
      item2 = FactoryBot.create(:item, name: 'Nasi Semur Jengkol', category: new_category)

      expect(item.by_category(category.name)).to eq([item])
      expect(item.by_category(new_category.name)).to eq([item2])
    end
  end
end
