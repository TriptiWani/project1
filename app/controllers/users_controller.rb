class UsersController < ApplicationController
  before_action :authorise_user, :only => [:index]
  before_action :check_for_user, :only => [:edit, :update]

  def self.mail_recap_semaine
    @user = User.all
    @user.each do |u|
      UserMailer.mail_recap_semaine(u.email).deliver
    end
  end

  def index
    @users = User.all
  end

  def twitter_login
    credentials = request.env['omniauth.auth']['credentials']
    session[:access_token] = credentials['token']
    session[:access_token_secret] = credentials['secret']
    @user = client.user(include_entities: true)
    twitter_id = @user["id"]
    @current_user = User.find_or_create_by(:twitter_id => twitter_id, :email =>  @user.name  )
    @current_user.password_digest = "chicken"
    @current_user.save

    session[:user_id] = @current_user.id

    redirect_to root_path
  end

  def login
    @user = User.koala(request.env['omniauth.auth']['credentials'])
   facebook_id = @user["id"]
   email = @user["email"]
   image = @user['picture']['data']['url']
   @current_user = User.find_or_create_by(:facebook_id => facebook_id, :email => email)
   @current_user.first_name = @user["first_name"]
   @current_user.last_name = @user["last_name"]
   @current_user.password_digest = "chicken"
   @current_user.image = image
   @current_user.save
   session[:user_id] = @current_user.id

   redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @admin = User.find_by(:admin => true)
    @user = User.new user_params
    if (params[:file]).present?
      req = Cloudinary::Uploader.upload(params[:file])
      @user.image = req["url"]
    end
    if @user.save
      UserMailer.welcome(@user,@admin).deliver_now
      session[:user_id] = @user.id
      flash[:notice] = 'Account successfully created'
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
    if (params[:file]).present?
      req = Cloudinary::Uploader.upload(params[:file])
      @user.image = req["url"]
    end
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
    params.require(:user).permit(:first_name,:last_name,:email,:dob,:gender,:password,:password_confirmation,:phone_number,:address,:image,:active,:currency)
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
