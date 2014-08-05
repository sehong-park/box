class UnitsController < ApplicationController
  #before_action :correct_user_in_order
  
  def create
    @order = Order.find_by(id: flash[:order_id])
    @units = Array.new
    
    flash[:unit_count].each do |type, count|
      count.to_i.times do
        @unit = @order.units.build(type: type)
        @units.push(@unit)
      end
    end
    
    @units.each do |unit|
      unit.save
    end
    
    redirect_to @order
  end
  
  #################################################
  def unit_params
    
  end
  
  def correct_user_in_order
     
  end
  #################################################
end
