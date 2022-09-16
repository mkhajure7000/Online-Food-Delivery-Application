class Food < ApplicationRecord

  # Associations
  belongs_to :restaurant
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many_attached :images

  #VALIDATIONS
  validates :name, :price, :quantity, presence: true
  validates :images, presence: true

end
