class OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def create
    @order = User.new(order_params)
    if @order.save
      flash[:success] = "New order created!"
      redirect_to @order
    else
      flash[:warning] = "Ordering failed.."
      render 'new'
    end
  end
end
