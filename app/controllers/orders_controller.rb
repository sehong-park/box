class OrdersController < ApplicationController
  before_action :signed_in_user
  
  include OrdersHelper
  
  def index
    
  end
  
  def new
    @order = Order.new
    
    @unit_body = collapse_panel_body("orders/unit")
    @unit_panel = collapse_panel(1, "보관품 정보를 알려주세요!", @unit_body)
  
    @date_body = collapse_panel_body("orders/date")
    @date_panel = collapse_panel(2, "보관기간을 알려주세요!", @date_body)
    
    @address_body = collapse_panel_body("orders/address")
    @address_panel = collapse_panel(3, "픽업장소와 회송장소를 알려주세요!", @address_body)
    
    @user_body = collapse_panel_body("orders/user")
    @user_panel = collapse_panel(4, "사용자 정보를 알려주세요!", @user_body)
  end
  
  def create
    @order = current_user.orders.build(order_params)
    calculate_charge(@order)
    
    if @order.save
      flash[:success] = "New order created!"
      redirect_to @order
    else
      flash[:warning] = "Ordering failed.."
      render 'new'
    end
  end
  
  def show
    @order = Order.find(params[:id])
    @user = current_user
  end
  
  private ########################################
    def order_params
      params.require(:order).permit(:unit_count,
                                    :pickup_datetime,
                                    :delivery_datetime,
                                    :pickup_address,
                                    :delivery_address)           
    end
  ################################################
end
