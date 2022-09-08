class RestaurantsController < ApplicationController
  before_action :logged_in_user
  before_action :is_admin ,only: %i[index new create edit update destroy]
  before_action :current_restaurant, only: %i[update edit destroy]

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
    flash[:notice] = "Delete Successfully"
    redirect_to restaurants_path, status: :see_other
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end

  def is_admin
    if !current_user.is_admin?
      flash[:notice] = "You are not admin"
      redirect_to users_path
    end
  end

  def current_restaurant
    @restaurant = current_user.restaurants.find_by(id: params[:id])
    if @restaurant.blank?
      flash[:errors] = "restaurant  does not exists"
      redirect_to restaurants_path
    end
  end

end
