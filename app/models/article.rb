class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  
  TYPES = { "질문/답변" => 0, # 질문/답변
            "이용후기" => 1} # 후기
  
  #default scope
  default_scope -> { order('created_at DESC') }
  
  #validates
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }
  
  
end
