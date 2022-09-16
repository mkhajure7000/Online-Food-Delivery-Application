class CartItemsController < ApplicationController
  before_action :get_cart_items, only: %i[destroy add_quantity reduce_quantity]

  def index
    @cart_items = @current_cart.cart_items.all
  end

  def create
    @food = Food.find(params[:food_id])
    if @current_cart.foods.include?(@food)
      @cart_item = @current_cart.cart_items.find_by(:food_id => @food)
      @cart_item.quantity += 1
    else
      @cart_item = @current_cart.cart_items.new(food_id: params[:food_id])
      @cart_item.save
    end
    redirect_to cart_items_path
  end 

  def destroy
    @cart_item.destroy
    redirect_to cart_items_path
  end  
  
  def add_quantity
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to cart_items_path
  end
  
  def reduce_quantity
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
    end
    @cart_item.save
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity,:food_id, :cart_id)
  end

  def get_cart_items
    @cart_item = @current_cart.cart_items.find(params[:id])
  end

end
