require 'open-uri'

class UsersController < ApplicationController

  def abhi_api_key
    return "e7ad2l8bTg2d4g4459A4d07Obdg7QKMn"
  end
  
  def index
    @users = User.all
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by_id(params[:id])
  end
  
  def destroy
    user = User.find_by_id(params[:id])
    user.destroy
    redirect_to users_url, :notice => 'You no longer exist!'
  end
  
  def create
    user = User.new(params[:user])
    if open("https://readitlaterlist.com/v2/auth?username=#{params[:user][:user_name]}&password=#{params[:user][:password]}&apikey=#{abhi_api_key}")
      redirect_to users_url, :notice => "Sorry, you need to provide a ReaditLater username and/or password!"
    end
    
    if user.save
      redirect_to users_url, :notice => "Welcome, #{user.user_name} thanks for signing up!"
    else
      redirect_to users_url, :notice => "Sorry, your passwords did not match!"
    end
  end

end
