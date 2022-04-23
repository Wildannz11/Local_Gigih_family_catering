class Item < ApplicationRecord
    
    has_many :assignments
    has_many :categories, through: :assignments

    has_many :carts
    has_many :orders, through: :carts
    
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true, length: { maximum: 150 }
    validates :price, numericality: true
    validates_numericality_of :price, :greater_than => 0.01

end
