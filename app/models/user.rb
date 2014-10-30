class User < ActiveRecord::Base
  
  attr_accessible :name, :email, :password, :password_confirmation
  
  has_secure_password
  
  has_many :topics
  has_many :comments
  
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email
  
  before_create :default_active
  before_create :default_role
    
  private
    def default_role
      self.role ||= "member"
  end 
  
  private
    def default_active
      self.active ||= true
  end 
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end


# Soft-delete implementation with scopes

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
   
end