class User < ActiveRecord::Base
  
  attr_accessible :name, :email, :password, :password_confirmation
  
  has_secure_password
  
  has_many :topics
  has_many :comments
  
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email
  
  #default_scope { where(active: true) }
   
end