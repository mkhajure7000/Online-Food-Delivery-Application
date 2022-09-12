class Food < ApplicationRecord

  # Associations
  belongs_to :restaurant
  has_many_attached :images
  has_and_belongs_to_many :carts
  has_many :cart_items

  #VALIDATIONS
  validates :name, :price, :quantity, presence: true
  validates :images, presence: true

end
