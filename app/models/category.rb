class Category < ApplicationRecord
    has_many :assignments, dependent: :destroy
    has_many :items , through: :assignments

    validates :name, presence: true, uniqueness: true
end
