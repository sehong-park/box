class Admin::UnitsController < ApplicationController
  before_action :admin_user
  
  def new
    @unit = Unit.new(order_id: params[:format])
  end

  def create
    @unit = Unit.new(unit_params)

    if @unit.save
      flash[:success] = "New unit created!"
      redirect_to @unit.order
    else
      flash[:warning] = "Creating failed.."
    end
  end

  ########################
    def unit_params
      params.require(:unit).permit(:name, :content, :unit_type, :order_id)
    end
  ########################
end
