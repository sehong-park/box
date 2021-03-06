class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update]
  before_action :admin_user, only: [:index, :destroy]
  
  def new
    if signed_in?
      flash[:warning] = "Already signed up!"
      redirect_to(root_path)
    end
    
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = t 'controller.users.create.succeed'
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @orders = @user.orders.order(created_at: :desc).where.not(status: Order::STATUS[:deleted])
  end
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end
  
  private #########################################################
    
    def user_params
      params.require(:user).permit(:name, :email, :phone, :password,
                                   :password_confirmation)
    end
  
    # Before filters
   def correct_user
      @user = User.find(params[:id])
      unless (current_user?(@user) || current_user.admin?)
        flash[:warning] = "타인의 정보는 열람하실 수 없습니다."
        redirect_to(root_url)
      end
   end
  ###################################################################
end
