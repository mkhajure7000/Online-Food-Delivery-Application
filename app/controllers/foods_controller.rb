class FoodsController < ApplicationController
  before_action :get_restaurant, only: %i[index new create edit update destroy]
  before_action :set_food, only: %i[edit update destroy]

  def index
    @foods = @restaurant.foods.all
  end

  def new
    @food = Food.new
  end
  
  def create
    @food = @restaurant.foods.new(food_params)
    if @food.save
      redirect_to restaurant_foods_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @food.update(food_params)
      redirect_to restaurant_foods_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @food.destroy
    flash[:notice] = "Delete Successfully"
    redirect_to restaurant_foods_path, status: :see_other
  end

  private
  def food_params
    params.require(:food).permit(:name, :price, :quantity)
  end
  
  def get_restaurant
    @restaurant = current_user.restaurants.find_by(id: params[:restaurant_id])
    if @restaurant.blank?
      flash[:errors] = "restaurant  does not exists"
      redirect_to restaurants_path
    end
  end

  def set_food
    @food = @restaurant.foods.find_by(id: params[:id])
    if @food.blank?
      flash[:errors] = "food  does not exists"
      redirect_to restaurant_foods_path
    end
  end

end
