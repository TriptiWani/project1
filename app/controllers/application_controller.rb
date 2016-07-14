class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :fetch_user
  # before_action :check_user

  private
  def fetch_user
    # search for a user by their user id if we can find one in the session hash
    if session[:user_id].present?
      @current_user = User.find_by :id => session[:user_id]
        #clear out the session user_id if no user is found
        session[:user_id] = nil unless @current_user
    end

  end

  def current_order
    if !session[:order_id].nil?
      @current_order = Order.find(session[:order_id])
    else
      @current_order = Order.new
    end
  end
end
