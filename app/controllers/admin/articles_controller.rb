class Admin::ArticlesController < ApplicationController
  before_action :admin_user
  
  def index
    @questions = Article.where(types: 0).where.not(order_id: nil) # 0: 질문답변
  end
  
end
