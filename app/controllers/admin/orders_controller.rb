class Admin::OrdersController < ApplicationController
  before_action :admin_user
  
  def index
    @orders = Order.all
  end
  
  def update # 주문의 STATUS를 다음단계로 진행한다
    @order = Order.find(params[:id])
    status = @order.status.to_i + 1
    
    if @order.update_attributes(status: status)
      flash[:success] = "Orders Status incresed"
      redirect_back_or admin_path
    else
      redirect_back_or admin_path
    end
  end
end
