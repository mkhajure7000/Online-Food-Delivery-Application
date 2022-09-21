class OrdersController < ApplicationController
  before_action :cart_items, only: :create

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def create
    @order = current_user.orders.new(order_params.merge(total_amount: @current_cart.total_cart_price))
    if @order.save
      @current_cart.cart_items.each do |cart_item|
        @order_items = @order.order_items.create(food_id: cart_item.food_id, quantity: cart_item.quantity)
      end
      @current_cart.cart_items.destroy_all
    end 
    redirect_to order_path(@order)
  end

  private
  def order_params
    params.permit(:address)
  end

  def cart_items
   @cart_items = @current_cart.cart_items
  end
  
end
