class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  
  #name
  validates :name, presence: true, length: { minimum:2, maximum: 50 }
  
  #email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  #phone
  #validates :phone, presence: true, length { minimum: 7, maximum: 20}
  
  #span_time //보관기간
  #validates :span_time, presence: true, length { maximum: 20 }
  
  #pickup_date
  #validates :pickup_date, presence: true, length { maximum: 20 }
  
  #pickup_location
  #validates :pickup_location, presence: true, length { maximum: 200 }
  
  #delivery_location
  #validates : length { maximum: 200 }
  
  #box_description
  #validates :box_description, presence: true, length { maximum: 1000 }
  
  #any_question
  #validates :any_question, length { maximum: 250 }
  
  #knowing_route
  #validates :knowing_route, length { maximum: 50 }
  
  #password_digest
  has_secure_password
  validates :password, length: { minimum: 6 }
end
