class Cart < ApplicationRecord

  # Associations
  belongs_to :user
  has_many :cart_items
  has_many :foods, through: :cart_items

end
