class AddressesController < ApplicationController
  before_action :logged_in_user
  before_action :set_address, only: %i[edit update destroy]

  def index
    @addresses = current_user.addresses.all
  end

  def new
    @address = Address.new
  end

  def create 
    @address = current_user.addresses.new(address_params)
    if @address.save
      redirect_to user_addresses_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @address.update(address_params)
      redirect_to user_addresses_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @address.destroy
    flash[:notice] = "Delete Successfully"
    redirect_to user_addresses_path, status: :see_other
  end

  def address_params
    params.require(:address).permit(:area, :city, :state, :pincode)
  end

  def set_address
    @address = current_user.addresses.find_by(id: params[:id])
    if @address.blank?
      flash[:errors] = "Address  does not exists"
      redirect_to user_addresses_path
    end
  end

end
