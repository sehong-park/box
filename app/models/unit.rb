class Unit < ActiveRecord::Base
  
  PRICE = {default: 9900}
  TYPES = [:carrier, :regular, :hard]
  UNIT_RANGE = (1..10).to_a
  UNIT_IMAGE = { carrier: "/assets/welcome/storage-1.png",
               regular: "/assets/welcome/storage-2.png",
               hard: "http://goo.gl/NOC18R" }
  
  belongs_to :order
  
  has_attached_file :img,
    styles: { medium: "200x200>", thumb: "32x32>" },
    :default_url => "/images/:style/missing.png"

  validates_attachment :img, presence: true,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
  size: { in: 0.. 2.megabytes }
  
  validates :order_id, presence: true
  validates :unit_type, presence: true
  
end
