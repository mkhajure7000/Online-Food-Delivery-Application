class OrderItem < ApplicationRecord

  # Associations
  belongs_to :order
  belongs_to :food

  def total_price
    self.food.price * quantity
  end
  
end
