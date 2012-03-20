class TagsController < ApplicationController

  def tag
    @new_tags = params[:tags].split(',')
    @article = Article.find_by_id params[:id]
    @updated_tags = @article.categories_from(current_user) + @new_tags
    current_user.tag(@article, :with => @updated_tags, :on => :categories)
    redirect_to article_url(@article.id)
  end
  
  def remove
    @
  
end
