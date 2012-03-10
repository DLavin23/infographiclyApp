require 'open-uri'

class PagesController < ApplicationController
  
  def home
    # when a user signs up for first time, we need to make sure that the uname and password they provide is indeed a 
    # read it later uname and password
    
  end

  def about
  end

  def contact
  end
  
  def show_source
    @source = params[:source]
    @articles = current_user.articles.where("source = ?", "#{@source}")
    @articles = @articles.order('time_added desc').page(params[:page]).per(20)
  end

end
