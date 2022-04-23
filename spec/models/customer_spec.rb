require 'rails_helper'

RSpec.describe Customer, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject(:customer) do
    FactoryBot.create(:customer)
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:customer)).to be_valid
  end

  it 'is valid with a name' do
    expect(customer).to be_valid
  end
        
  it "is valid valid email address " do 
    expect(FactoryBot.create(:customer, email: "valid@email.com")).to be_valid
  end  

  it 'is invalid with a wrong format email' do
    customer = FactoryBot.build(:customer, email: 'wrong format email')
    customer.valid?
    expect(customer.errors[:email]).to include("Email is invalid")
  end

  it "is invalid with a duplicate email" do
    cus1 = FactoryBot.create(:customer, email: 'email@mail.com')
    cus2 = FactoryBot.build(:customer, email: 'email@mail.com')
    cus2.valid?
    expect(cus2.errors[:email]).to include("has already been taken")
  end

end
