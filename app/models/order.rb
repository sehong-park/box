class Order < ActiveRecord::Base
  
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  has_many :units, dependent: :destroy
  
  validates :user_id, presence: true
#  validates :unit_count, presence: true
#  validates :store_weeks, presence: true
#  validates :charge, presence: true
  validates :pickup_address, presence: true, length: { maximum: 100 }
  validates :delivery_address, presence: true, length: { maximum: 100 }
  validates :why_ordering, presence: true, length: { maximum: 20 }
end
