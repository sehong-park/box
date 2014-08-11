class Unit < ActiveRecord::Base
  
  UNIT_RANGE = (1..10).to_a
  UNIT_IMAGE = { carrier: "http://goo.gl/fYejCs",
               regular: "http://goo.gl/wH8z0E",
               hard: "http://goo.gl/NOC18R" }
  
  belongs_to :order
  
  has_attached_file :img,
    styles: { medium: "200x200>", thumb: "64x64>" },
    :default_url => "/images/:style/missing.png"

  validates_attachment :img, presence: true,
    content_type: { content_type: ["image/jpeg", "image/gif"] },
  size: { in: 0.. 2.megabytes }
  
  validates :order_id, presence: true
  validates :unit_type, presence: true
  
end
