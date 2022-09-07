class Food < ApplicationRecord

  # Associations
  belongs_to :restaurant
  has_one_attached :image
  #VALIDATIONS
  validates :name, :price, :quantity, presence: true
  validates :image, presence: true

end
