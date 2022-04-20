class OrderDetail < ApplicationRecord
  has_many :item
  belongs_to :order

  validates :quantity, presence: true
  validates :item_price, presence: true

end
