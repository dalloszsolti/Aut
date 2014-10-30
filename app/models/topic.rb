class Topic < ActiveRecord::Base

attr_accessible :active, :id, :opened_at, :title, :description

belongs_to :user
has_many :comments

validates_presence_of :title, :description, :user, :on => :create
validates_uniqueness_of :title

# Soft-delete implementation with scopes

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

end
