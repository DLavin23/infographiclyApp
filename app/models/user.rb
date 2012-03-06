class User < ActiveRecord::Base
  
  has_secure_password
  has_many :articles
  has_many :tags
  
  validates_uniqueness_of :user_name

end
