class OrdersController < ApplicationController
  before_action :signed_in_user
  include OrdersHelper
  def index
    
  end
  
  def new
    @order = Order.new
    @user = User.new
    
    @unit_panel_body = collapse_panel_body("orders/unit_form")
    @unit_panel = collapse_panel(1, "보관물품 정보를 알려 주세요.", @unit_panel_body)
  
    @pickup_panel_body = collapse_panel_body("orders/pickup_form")
    @pickup_panel = collapse_panel(2, "픽업 정보를 작성해 주세요.", @pickup_panel_body)
    
    @user_panel_body = collapse_panel_body("orders/user_form")
    @user_panel = collapse_panel(3, "사용자 정보를 기록해 주세요.", @user_panel_body)
  end
  
  def create
#    @order = current_user.orders.build(order_params)
#    calculate_charge(@order)
#    
#    if @order.save
#      flash[:success] = "New order created!"
#      redirect_to @order
#    else
#      flash[:warning] = "Ordering failed.."
#      render 'new'
#    end
  end
  
  def show
    @order = Order.find(params[:id])
    @user = current_user
  end
  
  private ########################################
    def order_params
      params.require(:order).permit(:unit_count,
                                    :store_weeks,
                                    :why_ordering,
                                    :pickup_address,
                                    :pickup_datetime )           
    end
  ################################################
end
