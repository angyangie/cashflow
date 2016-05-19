class SessionsController < ApplicationController

  def new
  end

  def create
     @user = User.find_by(email: params[:user][:email])
     if @user && @user.authenticate(params[:user][:password])
       session[:user_id] = @user.id
       redirect_to @user
     else
       flash[:error] = "Invalid Username or Password. Please try again."
       redirect_to login_path
     end
  end

  def destroy
    session.delete :user_id
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end