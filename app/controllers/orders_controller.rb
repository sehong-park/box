class OrdersController < ApplicationController
  before_action :signed_in_user
  include OrdersHelper
  def index
    
  end
  
  def new
    @order = Order.new
    @units = units
    @units_panel_body = collapse_panel_body("orders/unit", @units)
    @units_panel = collapse_panel(1, "유닛설정", @units_panel_body)
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
                                    :store_weeks,
                                    :why_ordering,
                                    :pickup_address,
                                    :pickup_datetime )           
    end
  ################################################
end
