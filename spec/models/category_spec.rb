require 'rails_helper'

RSpec.describe Category, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject(:category) { 
    FactoryBot.create(:category)
  }

  it 'has a valid factory' do
    expect(FactoryBot.build(:category)).to be_valid
  end

  it 'is valid with a name' do
    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category.name = nil
    category.valid?
    expect(category.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    category1 = FactoryBot.create(:category, name: 'Nasi Uduk')
    category2 = FactoryBot.build(:category, name: 'Nasi Uduk')
    category2.valid?
    expect(category2.errors[:name]).to include("has already been taken")
  end
  
end
