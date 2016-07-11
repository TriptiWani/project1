class UsersController < ApplicationController
  before_action :authorise_user, :only => [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  def edit
    @user = User.find_by :id => params[:id]
  end

  def update
    @user = User.find_by :id => params[:id]
    @user.update user_params

    redirect_to user_path
  end

  def show
    @user = User.find params[:id]
  end

  def destroy
    @user = User.find_by :id => params[:id]
    @user.destroy

    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:dob,:gender,:password,:password_confirmation,:phone_number,:address,:image)
  end

  def authorise_user
    redirect_to root_path unless @current_user.present? && @current_user.admin?
  end

end
