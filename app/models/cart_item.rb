class CartItem < ApplicationRecord

  # ASSOCIATIONS
  belongs_to :food
  belongs_to :cart

  def total_price
    self.food.price * quantity
  end

end
