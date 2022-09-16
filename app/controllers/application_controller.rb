class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :set_current_cart

  def current_user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end
  
  def logged_in?
    !current_user.nil?
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def set_current_cart
    @current_cart ||= current_user.get_cart if current_user.present?
  end

end
