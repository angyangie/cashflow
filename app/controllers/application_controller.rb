class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]
  helper_method :current_user, :logged_in?

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user != nil
  end
 
private 

  def require_login
    if !session[:user_id]
      flash[:error] = "You are not logged in"
      redirect_to login_path
    end
  
  end

end
