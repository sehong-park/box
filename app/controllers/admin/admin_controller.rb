class Admin::AdminController < ApplicationController
  before_action :admin_user
  http_basic_authenticate_with name: "iambox", password: "iambox"
  
  def index
    @new_orders = Order.order(created_at: :asc).where(status: Order::STATUS[:orderd])
    pickup_range = (Time.now - 21.day)..Time.now.midnight
    @orders_waiting_for_pickup = Order.order(pickup_datetime: :desc).where(
      { pickup_datetime: pickup_range, status: Order::STATUS[:permitted] })
  end
  
  
end
