require 'rails_helper'

RSpec.describe Customer, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject(:customer) do
    FactoryBot.create(:customer)
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:customer)).to be_valid
  end

  it 'is valid with a name ' do
    expect(customer).to be_valid
  end
        
  it "with an valid address " do 
    expect(FactoryBot.create(:customer, email: "valid@email.com")).to be_valid
  end  

  # it "is an invalid email address format" do 
  #   customer.email = "invalid.email.com"
  #   customer.valid?
  #   expect(customer.errors[:email]).to include("email must be use right format")
  # end

  describe 'email field' do
    subject { Customer.new(name: 'jan', email: 'jan@foo.com', phone: '223856737', address: "tetf aejnt").valid? }
  
    context 'when email has wrong format' do
      let(:email) { 'jan@foo' }
  
      it 'complains for invalid format' do
        is_expected.to eq false
      end
  
      let(:email) { 'jan' }
  
      it 'complains for invalid format' do
        is_expected.to eq false
      end
    end
  
    context 'when email has correct format' do
  
      it 'accepts valid format' do
        is_expected.to eq true
      end
    end
  end


end
