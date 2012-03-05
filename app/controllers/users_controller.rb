require 'open-uri'

class UsersController < ApplicationController
  
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
    user.save
    list  = JSON.parse(open("https://readitlaterlist.com/v2/get?username=#{user.user_name}&password=#{user.password}&apikey=e7ad2l8bTg2d4g4459A4d07Obdg7QKMn").read)["list"]
    Article.parse_json(list, user.id)
    session[:user_id] = user.id
    redirect_to articles_url, :notice => "Welcome, #{user.user_name} thanks for signing up!"    
  end

end
