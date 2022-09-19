class Order < ApplicationRecord

  # Associations
  belongs_to :user
  has_many :order_items
  has_many :foods, through: :order_items

end
