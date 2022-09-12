class Cart < ApplicationRecord

  # Associations
  belongs_to :user
  has_many :cart_items
  has_and_belongs_to_many :foods

end
