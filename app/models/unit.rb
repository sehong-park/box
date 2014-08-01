class Unit < ActiveRecord::Base
  
  UNIT_RANGE = (1..10).to_a
  UNIT_TYPE = ["carrier", "regular", "hard"]
  
end
