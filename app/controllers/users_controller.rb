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
    @user = current_user
    @categories = current_user.articles.tag_counts_on(:categories)
  end
  
  def destroy
    user = User.find_by_id(params[:id])
    Article.where("user_id = ?", "#{user.id}").destroy_all
    user.destroy
    redirect_to users_url, :notice => 'You no longer exist!'
  end
  
  def create
    user = User.new(params[:user])
    user.user_name = params[:user][:user_name].downcase
    if user.save
    list  = JSON.parse(open("https://readitlaterlist.com/v2/get?username=#{user.user_name}&password=#{user.password}&apikey=e7ad2l8bTg2d4g4459A4d07Obdg7QKMn").read)["list"]
    stats =  JSON.parse(open("https://readitlaterlist.com/v2/stats?username=#{user.user_name}&password=#{user.password}&apikey=e7ad2l8bTg2d4g4459A4d07Obdg7QKMn").read)
    user.fill_stats(stats)
    Article.populate_db(list, user.id)
    session[:user_id] = user.id
    UserMailer.digest_email(user).deliver
    redirect_to user_url(user.id), :notice => "Welcome, #{user.user_name} thanks for signing up!"    
    else 
      redirect_to new_user_url, :notice => "There is already a user with this Read it Later Account"
    end
  end

end
