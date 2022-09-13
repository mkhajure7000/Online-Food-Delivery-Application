class CartItem < ApplicationRecord

  belongs_to :food
  belongs_to :cart

  def total_price
    self.food.price * quantity
  end

end
