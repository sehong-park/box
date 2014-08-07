class Admin::OrdersController < ApplicationController
  before_action :admin_user
  
  def index
    @new_orders = Order.where(permitted: false)
  end
  
  def update # only for permitted 새 주문을 승인한다
    @new_order = Order.find(params[:id])
    
    if @new_order.update_attributes(permitted: true)
      flash[:success] = "Order updated"
      redirect_to admin_path
    else
      redirect_back_or admin_path
    end
  end
end
