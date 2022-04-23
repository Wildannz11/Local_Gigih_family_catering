class Order < ApplicationRecord
  has_many :carts
  has_many :items, through: :carts
  belongs_to :customer

  validates :total_price, presence: true
  validates :order_date, presence: true
  validates :status, presence: true
  validates_presence_of :carts, message: 'cannot be empty'

  accepts_nested_attributes_for :carts, allow_destroy: true

  def self.by_total_price(total_price)
    where("total_price >= ?", total_price).order(total_price: :desc)
  end

  def total_price
	  self.carts.map { |cart| cart.sub_total_price }.sum
	end

  def self.by_order_date(order_date)
    where('order_date == ?', order_date).order(status: :desc)
  end

  def self.get_todays_date
    Time.now.strftime('%Y-%m-%d')
  end

  def self.by_customer_email(email)
    joins(:customer).where('customers.email == ?', email).order(status: :desc)
  end

  def self.by_total_price(total_price)
    where('total_price >= ?', total_price).order(total_price: :desc)
  end
 

end
