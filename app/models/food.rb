class Food < ApplicationRecord

  # Associations
  belongs_to :restaurant
  has_many :cart_items

  #VALIDATIONS
  validates :name, :price, :quantity, presence: true
  validates :images, presence: true

end
