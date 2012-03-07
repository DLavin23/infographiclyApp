class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    @user = User.find_by_user_name(params[:user_name].downcase)
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to articles_url, :notice => "Welcome to InfoGraphic.ly, #{@user.user_name}"
    else
      redirect_to users_url, :notice => 'Sorry, that User Name and/or Password is incorrect'
    end
  end
  
  def logout
    reset_session
    redirect_to new_user_url, :notice => "Thanks for using InfoGraphic.ly, come back soon!"
  end
  
end
