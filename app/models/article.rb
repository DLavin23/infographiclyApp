
require 'uri'

class Article < ActiveRecord::Base
  
  belongs_to :user
  has_many :tags
  
  validates :item_id, :uniqueness => true
  
  
  def self.populate_db(list, userid)
    list.each do |article|
      new_article = Article.new
      new_article.item_id = article[1]["item_id"]
      new_article.title = article[1]["title"]
      new_article.url = article[1]["url"]
      new_article.time_added = Time.at((article[1]["time_added"]).to_i).strftime("%B %d, %Y %I:%M%p")
      new_article.time_updated = Time.at((article[1]["time_updated"]).to_i).strftime("%B %d, %Y %I:%M%p")
      new_article.state = article[1]["state"]
      new_article.shortlink = URI(article[1]["url"]).host.sub(/^www\./,"")
      new_article.source = new_article.shortlink.split('.')[0]
      new_article.user_id = userid
      new_article.save
    end
  end
  
  def self.update_state(list)
    list.each do |article|
      current_article = Article.find_by_item_id article[1]["item_id"]
      current_article.update_attribute :state, article[1]["state"]
    end
  end

  def self.assign_category
    articles = Article.all[0..150]
    articles.each do |article|
      article.update_attribute :source, "Business"
    end    
    articles = Article.all[151..300]
    articles.each do |article|
      article.update_attribute :source, "Sports"
    end    
    articles = Article.all[301..450]
    articles.each do |article|
      article.update_attribute :source, "Entertainment"
    end
    articles = Article.all[451..930]
    articles.each do |article|
      article.update_attribute :source, "Technology"
    end  
  end
end
