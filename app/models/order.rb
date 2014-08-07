class Order < ActiveRecord::Base
  
  belongs_to :user
  has_many :units, dependent: :destroy
  
  default_scope -> { order('created_at DESC') }
  
  validates :user_id, presence: true
  validates :unit_count, presence: true, numericality: { greater_than: 0 }
  validates :units_info, presence: true
  validates :store_weeks, presence: true
  validates :charge, presence: true
  validates :pickup_address, presence: true, length: { maximum: 100 }
  validates :delivery_address, presence: true, length: { maximum: 100 }
  validates :why_ordering, presence: true, length: { maximum: 20 }
end
