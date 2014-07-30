class OrdersController < ApplicationController
  before_action :signed_in_user
  
  def index
    
  end
  
  def new
    @order = Order.new
    @unit = {
      carrier: { name: "캐리어", src: "http://travelmate.co.kr/images/product_images/thumbnails/226849_A3.jpg"},
      regular: { name: "종이박스", src: "http://boxga.com/shop/upfiles/box-165_1.gif"},
      hard: { name: "하드박스", src: "http://blogpfthumb.phinf.naver.net/20140730_161/sehong_box_1406721531816Gv4Kb_JPEG/1180100.jpg?type=w161" }
    }
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
