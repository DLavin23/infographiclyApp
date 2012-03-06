require 'open-uri'

class ArticlesController < ApplicationController
  
  def index
    @user = User.find_by_id session[:user_id]  
    @articles = Article.where("user_id = ?", "#{@user.id}")
    @articles = @articles.order('time_added asc').page(params[:page]).per(10)
  
  end

  def show
  
  end
  
  # def update
  #   # Currently, updating time_added and time_updated on articles but in 
  #   # future it should check stats api to check if new articles hv been 
  #   # added and then populate the database
  #   
  #   articles = Article.where("user_id = ?", "#{session[:user_id]}")
  #   get_list  = JSON.parse(open("https://readitlaterlist.com/v2/stats?username=#{user.user_name}&password=#{user.password}&apikey=e7ad2l8bTg2d4g4459A4d07Obdg7QKMn").read)["list"]
  #   get_list.each do |article|
  #     current_article = Article.find_by_item_id article[1]["item_id"]
  #     if current_article.time_added != article[1]["time_added"]
  #       current_article.update_attribute :time_added, Time.at((article[1]["time_added"]).to_i).strftime("%B %d, %Y %I:%M%p")
  #     elsif current_article.time_updated != article[1]["time_updated"]
  #       current_article.update_attribute :time_updated, Time.at((article[1]["time_updated"]).to_i).strftime("%B %d, %Y %I:%M%p")
  #     else
  #     end
  #   end
  # end


end
