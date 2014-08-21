class OrdersController < ApplicationController
  before_action :signed_in_user, except: [:pricing]
  before_action :owner_or_admin, only: [:show, :edit, :update, :delete, :checked]
  
  include OrdersHelper
  
  def index
    
  end
  
  def pricing
    @pricing = pricing_order_params
    
#    render 'test/test'
#    render 'welcome/pricing/_result'
    respond_to do |format|
      format.js
    end
  end
  
  def new
    @order = Order.new
  end
  
  def create
    @order = current_user.orders.build(order_params)
    
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
    @units = @order.units
  end
  
  def edit
    @order = Order.find(params[:id])
    updating_deny if (@order.status != 0 && !current_user.admin?)
    
    
  end
  
  def update
    @order = Order.find(params[:id])
    updating_deny if (@order.status != 0 && !current_user.admin?)
    
    if @order.update_attributes(order_params)
      flash[:success] = "Order updated"
      redirect_to current_user
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
      raw_params = params.require(:order).permit(
        {unit_count: [:carrier, :regular, :hard]},
        {pickup_datetime: [:year, :month, :day, :hour]},
        {delivery_datetime: [:year, :month, :day, :hour]},
        :pickup_address, :pickup_location,
        :delivery_address, :delivery_location,
        :why_ordering, :extra_checked)
      
      raw_params.has_key?("extra_checked") ? raw_params : order_params = filtered_order(raw_params)
    end
  
    def order_attributes(attributes)
      attributes.permit(
        :unit_count,
        :pickup_datetime,
        :delivery_datetime,
        :pickup_address,
        :delivery_address,
        :why_ordering)
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
    raw_params = params.require(:order).permit(
        :unit_count,
        {pickup_datetime: [:year, :month, :day]},
        {delivery_datetime: [:year, :month, :day]},
        :pickup_location,
        :delivery_location)
    
      pricing_order(raw_params)
  end
  
  def checked_params
    params.require(:order).permit(:extra_checked)
  end
  ################################################
end
