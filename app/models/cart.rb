class Cart < ApplicationRecord

  # Associations
 belongs_to :user
 has_many :cart_items
 has_many :foods, through: :cart_items

 def total_cart_price
   total = 0
   self.cart_items.each do |cart_item|
     price = cart_item.food.price * cart_item.quantity
     total += price
   end
   return total
 end

end
