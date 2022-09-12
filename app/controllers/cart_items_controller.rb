class CartItemsController < ApplicationController

  def create
    chosen_food = Food.find(params[:food_id])
    current_cart = @current_cart
  
    if current_cart.foods.include?(chosen_food)
      @cart_item = current_cart.cart_items.find_by(:food_id => chosen_food)
      @cart_item.quantity += 1
    else
      @cart_item = CartItem.new
      @cart_item.cart = current_cart
      @cart_item.food = chosen_food
    end
    @cart_item.save
    redirect_to cart_path(current_cart)
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(@current_cart)
  end 

  private
    def cart_item_params
      params.require(:cart_item).permit(:quantity,:food_id, :cart_id)
    end

end
