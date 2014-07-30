class OrdersController < ApplicationController
  before_action :signed_in_user
  
  def index
    
  end
  
  def new
    @order = Order.new
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
  
  def calculate_charge(order)
    charge = order[:unit_count].to_i * order[:sotre_weeks].to_i
    order[:charge] = charge
  end
  ################################################
end
