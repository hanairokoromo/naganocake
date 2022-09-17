class CartItem < ApplicationRecord
    has_one_attached :image
    belongs_to :customer
    belongs_to :item
end
