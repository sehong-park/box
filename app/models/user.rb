class User < ActiveRecord::Base
  # Model Relation
  has_many :orders, dependent: :destroy
  
  # Before Action
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  #name
  validates :name, presence: true, length: { minimum:2, maximum: 50 }
  
  #email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  #phone
  validates :phone, presence: true, length: { maximum: 20 }
  
  #password_digest
  has_secure_password
  validates :password, length: { minimum: 6 }
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private ###########################################################
    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
  ###################################################################
end
