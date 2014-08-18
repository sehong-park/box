class Article < ActiveRecord::Base
  belongs_to :user
  
  TYPES = { qna: :qna }
end
