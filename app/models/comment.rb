class Comment < ActiveRecord::Base
  
  attr_accessible :content, :user_id
  
  belongs_to :topic
  belongs_to :user
  has_one :user
  
  validates_presence_of :content, :on => :create
  
end
