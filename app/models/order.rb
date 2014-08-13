class Order < ActiveRecord::Base
  
  belongs_to :user
  has_many :units, dependent: :destroy
  
  STATUS = {ordered: 0, # 주문완료
            permitted: 1, # 승인(입금)완료
            picking_up: 2, # 픽업중
            stored: 3, # 보관중
            delivering: 4, # 회송중
            delivered: 5} # 회송완료
  
  LOCATION = ["서울", "경기", "인천공항"]
  
  validates :user_id, presence: true
  validates :unit_count, presence: true, numericality: { greater_than: 0 }
  validates :units_info, presence: true
  validates :store_weeks, presence: true
  validates :charge, presence: true
  validates :pickup_address, presence: true, length: { maximum: 100 }
  validates :delivery_address, presence: true, length: { maximum: 100 }
  validates :why_ordering, presence: true, length: { maximum: 20 }
end
