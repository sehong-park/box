class Order < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  
  validates :user_id, presence: true
  validates :num_boxes, presence: true
  validates :weeks_storage, presence: true
  validates :charge, presence: true
  validates :location_pickup, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
end
