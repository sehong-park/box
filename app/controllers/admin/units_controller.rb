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
      render 'new'
    end
  end
  
  def edit
    @unit = Unit.find(params[:id])
  end
  
  def update
    @unit = Unit.find(params[:id])
    if @unit.update_attributes(unit_params)
      flash[:success] = "Unit updated"
      redirect_to @unit.order
    else
      render 'edit'
    end
  end
  
  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy
    flash[:success] = "Unit deleted."
    redirect_back_or order_path(@unit.order)
  end

  ########################
    def unit_params
      params.require(:unit).permit(:name, :content, :unit_type, :order_id, :img)
    end
  ########################
end
