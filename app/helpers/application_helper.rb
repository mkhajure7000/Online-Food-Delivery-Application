module ApplicationHelper

  def get_address
    all_address = []
    current_user.addresses.each do |address|
      add = address.area + ", " +  address.city + ", " + address.state + ",   Pin.- " +  address.pincode
      all_address << add
    end
    return all_address
  end

  def total_cart_price(cart_items)
    total = 0
    cart_items.each do |cart_item|
      price = cart_item.food.price * cart_item.quantity
      total += price
    end
    return total
  end

end
