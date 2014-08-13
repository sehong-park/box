class OrdersController < ApplicationController
  before_action :signed_in_user
  before_action :owner_or_admin, only: [:show, :edit, :update, :delete]
  
  include OrdersHelper
  
  def index
    
  end
  
  def pricing
    @pricing_order = Order.new(pricing_order_params)
    
#    respond_to do |format|
#      format.js
#    end
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
    #@unit_params = unit_count
    @order = current_user.orders.build(order_params)
    
    if @order.save
      flash[:success] = "New order created!"
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
  
  def edit
    @order = Order.find(params[:id])
    updating_deny if (@order.status != 0 && !current_user.admin?)
    
    @unit_body = collapse_panel_body("orders/unit")
    @unit_panel = collapse_panel(1, "보관품 정보를 알려주세요!", @unit_body)
  
    @date_body = collapse_panel_body("orders/date")
    @date_panel = collapse_panel(2, "보관기간을 알려주세요!", @date_body)
    
    @address_body = collapse_panel_body("orders/address")
    @address_panel = collapse_panel(3, "픽업장소와 회송장소를 알려주세요!", @address_body)
    
    @why_body = collapse_panel_body("orders/why_ordering")
    @why_panel = collapse_panel(4, "보관목적을 알려주세요!", @why_body)
  end
  
  def update
    @order = Order.find(params[:id])
    updating_deny if (@order.status != 0 && !current_user.admin?)
    
    if @order.update_attributes(order_params)
      flash[:success] = "Order updated"
      redirect_to @order
    else
      render 'edit'
    end
  end
  
  def destroy
    @order = Order.find(params[:id])
    
    if @order.status == 0
      @order.destroy
      flash[:success] = "Order deleted."
    else
      flash[:warning] = "Deleting denied."
    end
    
    redirect_back_or root_path
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
    
    def create_units(unit_params)
      unit_params[:unit_count].each do |type, count|
        count.to_i.times do
          @unit = @order.units.build(unit_type: type)
          @unit.save
        end
      end
    end
  
    def owner_or_admin
      unless owner? || current_user.admin?
        flash[:warning] = "직접 신청한 주문서 이외는 볼수 없습니다"
        redirect_to(root_url)
      end
    end
  
    def owner?
      @order = Order.find(params[:id])
      current_user?(User.find_by(id: @order.user_id))
    end
  
    def updating_deny
      flash[:warning] = "이미 승인된 내용을 수정할 수 없습니다."
      redirect_back_or(root_path) 
    end
  
  def pricing_order_params
    @raw_params = params.require(:order).permit(
        :unit_count,
        {pickup_datetime: [:year, :month, :day]},
        {delivery_datetime: [:year, :month, :day]},
        :pickup_location,
        :delivery_location)
    
      #@pricing_order = pricing_order(@raw_params)
  end
  ################################################
end
