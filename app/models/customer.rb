class Customer < ApplicationRecord
    has_many :orders
    
    
    validates :name, presence: true
    validates :phone, presence: true
    validates :address, presence: true
    validates :email, presence: true

    # def self.by_letter(letter)
    #     where("email LIKE ?", "#{letter}%").order(:email)
    # end

    def self.by_letter(email)
        where("email LIKE ?", "#{email}%").order(:email)
    end

end
