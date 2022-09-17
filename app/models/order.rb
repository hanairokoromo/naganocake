class Order < ApplicationRecord
    enum payment_method: {credit_card: 0, transfer: 1}
    enum status: {waiting: 0, confirm: 1, production: 2, preparing: 3, shipped: 4}
    has_one_attached :image
    belongs_to :customer
    has_many :order_details, dependent: :destroy
    
end
