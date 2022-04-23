class Customer < ApplicationRecord
    has_many :orders
    
    
    validates :name, presence: true, uniqueness: true
    validates :phone, presence: true
    validates :address, presence: true
    validates :email , email: true, uniqueness: true
   

end
