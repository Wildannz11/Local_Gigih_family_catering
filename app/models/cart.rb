class Cart < ApplicationRecord
  belongs_to :item
  belongs_to :order

  before_save :set_price, :set_subtotal_price

	def set_price
		self.price = self.item.price
	end

	def set_subtotal_price
		self.sub_total_price = self.quantity.nil? ? 1 * self.price : self.quantity * self.price
	end

end
