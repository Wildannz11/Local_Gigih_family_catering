class Order < ApplicationRecord
  has_many :order_detail
  belongs_to :customer

  validates :total_price, presence: true
  validates :order_date, presence: true
  validates :status, presence: true
  validates_numericality_of :total_price, :greater_than_or_equal_to => 50000.0

  def self.by_total_price(total_price)
    where("total_price >= ?", "#{total_price}%").order(:total_price)
  end

  # def self.by_range_time(selected_date_first, selected_date_second)
  #   where('order_date BETWEEN ? AND ?', @selected_date_first, @selected_date_second)
  # end  

end
