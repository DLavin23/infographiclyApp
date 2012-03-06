
class ArticlesController < ApplicationController
  
  def index
    @user = User.find_by_id session[:user_id]  
    @articles = Article.where("user_id = ?", "#{@user.id}")
    @articles = Article.order('time_added asc').page(params[:page]).per(8)
  
  end

  def show
  
  end


end
