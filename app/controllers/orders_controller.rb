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
    
#    @user_body = collapse_panel_body("orders/user")
#    @user_panel = collapse_panel(4, "사용자 정보를 알려주세요!", @user_body)
    
    @why_body = collapse_panel_body("orders/why_ordering")
    @why_panel = collapse_panel(4, "보관목적을 알려주세요!", @why_body)
  end
  
  def create
    @unit_params = Hash.new
    @unit_params = unit_count
    
    @order = current_user.orders.build(order_params)
    
    if @order.save
      flash[:success] = "New order created!"

      @unit_params[:unit_count].each do |type, count|
        count.to_i.times do
          @unit = @order.units.build(unit_type: type)
          @unit.save
        end
      end

      redirect_to @order

    else
      flash[:warning] = "Ordering failed.."
      
      @unit_body = collapse_panel_body("orders/unit")
      @unit_panel = collapse_panel(1, "보관품 정보를 알려주세요!", @unit_body)
  
      @date_body = collapse_panel_body("orders/date")
      @date_panel = collapse_panel(2, "보관기간을 알려주세요!", @date_body)
    
      @address_body = collapse_panel_body("orders/address")
      @address_panel = collapse_panel(3, "픽업장소와 회송장소를 알려주세요!", @address_body)
      
      @why_body = collapse_panel_body("orders/why_ordering")
      @why_panel = collapse_panel(4, "보관목적을 알려주세요!", @why_body)
      
      render 'new'
    end
  end
  
  def show
    @order = Order.find(params[:id])
    @units = @order.units.paginate(page: params[:page], per_page: 10)
  end
  
  private ########################################
    def order_params
      @raw_params = params.require(:order).permit(
        {unit_count: [:carrier, :regular, :hard]},
        {pickup_datetime: [:year, :month, :day, :hour]},
        {delivery_datetime: [:year, :month, :day, :hour]},
        :pickup_address,
        :delivery_address,
        :why_ordering)
      
      @order_params = filtered_order(@raw_params)
    end
  
    def unit_count
      params.require(:order).permit(
        {unit_count: [:carrier, :regular, :hard]})
    end
  
  def units
    @unit_array = Array.new
  end
  ################################################
end
