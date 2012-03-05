
class ArticlesController < ApplicationController
  
  def index
    @user = User.find_by_id session[:user_id]  
    @articles = Article.where("user_id = ?", "#{@user.id}")
  end

  def show
  
  end


end
