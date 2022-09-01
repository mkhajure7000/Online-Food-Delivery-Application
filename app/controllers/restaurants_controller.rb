class RestaurantsController < ApplicationController
  before_action :current_restaurant, only: %i[update edit destroy]
  before_action :logged_in_user

  def index
    @restaurants = current_user.restaurants.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_user.restaurants.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new, status: :unprocessable_entity
    end
  end
    
  def edit; end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end

  def current_restaurant
    @restaurant = current_user.restaurants.find_by(id: params[:id])
    if @restaurant.blank?
      flash[:errors] = "restaurant  does not exists"
      redirect_to restaurants_path
    end
  end

end
