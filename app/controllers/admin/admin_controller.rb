class Admin::AdminController < ApplicationController
  before_action :admin_user
  http_basic_authenticate_with name: "iambox", password: "iambox"
  
  def index
    @new_orders = Order.order(created_at: :asc).where(status: Order::STATUS[:ordered])
    
    @permitted_orders = Order.order(pickup_datetime: :asc).where(
      status: Order::STATUS[:permitted])
    
    @picking_up_orders = Order.order(pickup_datetime: :asc).where(
      status: Order::STATUS[:picking_up])
    
    @stored_orders = Order.order(delivery_datetime: :asc).where(
      status: Order::STATUS[:stored])
    
    @delivering_orders = Order.order(delivery_datetime: :asc).where(
      status: Order::STATUS[:delivering])
    
    @delivered_orders = Order.order(delivery_datetime: :asc).where(
      status: Order::STATUS[:delivered])
    
    @deleted_orders = Order.order(delivery_datetime: :asc).where(
      status: Order::STATUS[:deleted])
  end
  
  
end
