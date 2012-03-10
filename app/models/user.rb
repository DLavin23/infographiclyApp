require 'date'

class User < ActiveRecord::Base
  
  acts_as_tagger
  has_secure_password
  has_many :articles
  has_many :tags
  
  validates_uniqueness_of :user_name
  
  def fill_stats(stats)
    self.user_since = Time.at(stats["user_since"]).to_datetime
    self.count_list = stats["count_list"].to_i
    self.count_read = stats["count_read"].to_i
    self.count_unread = stats["count_unread"].to_i
    self.save
  end

end
