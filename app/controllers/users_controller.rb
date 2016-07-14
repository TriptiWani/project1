class UsersController < ApplicationController
  before_action :authorise_user, :only => [:index]
  before_action :check_for_user, :only => [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      # UserMailer.welcome(@user).deliver_now
      session[:user_id] = @user.id

      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    if @user.update user_params
      redirect_to user_path
    else
      render :edit
    end


  end

  def show
    @user = User.find params[:id]
  end

  def destroy
    @user = User.find_by :id => params[:id]
    @user.active = false
    @user.save

    session[:user_id] = nil

    redirect_to login_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:dob,:gender,:password,:password_confirmation,:phone_number,:address,:image,:active)
  end

  def authorise_user
    redirect_to root_path unless @current_user.present? && @current_user.admin?
  end

  def active_order
    @active_order = Order.find_by :user_id => @current_user.id , :status => 'new'
  end

  def check_for_user
    flash[:notice] = 'Please login' unless @current_user.present?
    redirect_to new_user_path unless @current_user.present?
  end

  def is_active_user
    redirect_to new_user_path unless @current_user.active?
  end

end
