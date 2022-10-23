class Genre < ApplicationRecord
    has_one_attached :image
    has_many :items, dependent: :destroy
    validates :name, presence: true
end
