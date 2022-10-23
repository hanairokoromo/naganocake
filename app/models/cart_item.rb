class CartItem < ApplicationRecord
    has_one_attached :image
    belongs_to :customer
    belongs_to :item
    
    validates :amount, presence: true
    
    def sum_of_price
        item.with_tax_price * amount
    end
    
    def subtotal
        item.with_tax_price * amount
    end
end
