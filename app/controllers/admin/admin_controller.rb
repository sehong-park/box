class Admin::AdminController < ApplicationController
  before_action :admin_user
  http_basic_authenticate_with name: "sehong", password: "foobar"
  
  def index
    @new_orders = Order.where(permitted: false)
  end
end
