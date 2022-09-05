class Food < ApplicationRecord

  # Associations
  belongs_to :restaurant
  
  #VALIDATIONS
  validates :name, :price, :quantity, presence: true

end

