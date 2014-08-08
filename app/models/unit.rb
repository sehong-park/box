class Unit < ActiveRecord::Base
  
  UNIT_RANGE = (1..10).to_a
  UNIT_IMAGE = { carrier: "http://goo.gl/fYejCs",
               regular: "http://goo.gl/wH8z0E",
               hard: "http://goo.gl/NOC18R" }
  
  belongs_to :order
  
  validates :order_id, presence: true
  validates :unit_type, presence: true

end
