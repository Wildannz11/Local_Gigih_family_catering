class Item < ApplicationRecord
    belongs_to :category
    # belongs_to :order_detail

    validates :name, presence: true, uniqueness: true
    validates :price, numericality: true
    validates_numericality_of :price, :greater_than => 0.01

    def self.by_letter(letter)
        where("name LIKE ?", "#{letter}%").order(:name)
    end

    def self.by_category(category)
        left_outer_joins(:category).where(categories: {name: "#{category}"})
    end
end
