class Order < ActiveRecord::Base
  
  belongs_to :user
  has_many :units, dependent: :destroy
  
  STATUS = {ordered: 0, # 주문완료
            permitted: 1, # 승인(입금)완료
            picking_up: 2, # 픽업중
            stored: 3, # 보관중
            delivering: 4, # 회송중
            delivered: 5} # 회송완료
  
  WHY_ORDERING = ["물품보관","이사", "여행", "출국", "기타"] 
  
  LOCATION = [["서울", 0], ["경기", 15000] , ["인천공항", 35000]]
  AVAILABLE_MEETING_TIMES = [["10시-13시",10], ["13시-16시", 13], ["16시-19시", 16]]
  
  validates :user_id, presence: true
  validates :unit_count, presence: true, numericality: { greater_than: 0 }
  validates :units_info, presence: true
  validates :store_weeks, presence: true
  validates :charge, presence: true
  validates :pickup_datetime, presence: true
  validates :delivery_datetime, presence: true
  validates :pickup_location, presence: true
  validates :pickup_address, presence: true, length: { maximum: 100 }
  validates :delivery_location, presence: true
  validates :delivery_address, presence: true, length: { maximum: 100 }
  validates :why_ordering, presence: true, length: { maximum: 20 }
end
