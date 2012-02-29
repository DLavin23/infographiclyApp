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
    redirect_to users_url, :notice => "Welcome, #{user.user_name} thanks for signing up!"
  end

end
