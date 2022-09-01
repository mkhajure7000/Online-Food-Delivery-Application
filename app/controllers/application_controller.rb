class ApplicationController < ActionController::Base
  helper_method :current_user
  
  def current_user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end
  
end
