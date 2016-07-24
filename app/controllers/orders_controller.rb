class OrdersController < ApplicationController
  before_action :check_user

  def report

  end

  def index
    from_date = params[:from_date]
    to_date = params[:to_date]

    if ( from_date.present? && to_date.present?)
      @order_items = Order.where(:updated_at => from_date...to_date)
      @admin = User.find_by(:admin => true)
      UserMailer.report(@order_items,@admin,from_date,to_date).deliver_now
    else
      if @current_user.admin?
        @order_items = Order.all
      else
        @order_items = Order.where(:user_id => @current_user.id)
      end
    end
  end

  def new
    @order = Order.new
  end
## for users.currency
  # def currency
  #   new_currency = params[:currency]
  #   @current_user.currency = new_currency
  #   @current_user.save
  #   redirect_to :back
  #
  # end


  def create
    order = Order.new order_params
    if order.save
      redirect_to orders_path
    else
      redirect_to new_order_path
    end
  end

  def edit
    @order = Order.find_by :id => params[:id]
  end

  def update
    @order = Order.find_by :id => params[:id]
    @order.update order_params

    redirect_to @order
  end

  def status
    @admin = User.find_by(:admin => true)
    action = params[:status]
    @order = Order.find_by :id => params[:id]
    if @order.line_items.any?
      if action.eql?'approved'
        status_flag = check_quantity(@order)
        if status_flag
          @order.status = action
          update_quantity(@order)
        else
          @order.status = 'rejected'
        end
        @order.save
        UserMailer.order_status(@order,@admin).deliver_now
      else
        @order.status = action
        @order.save
        UserMailer.order_status(@order,@admin).deliver_now
      end
    else
      @message = 'No items in the order'
      redirect_to products_path
    end
  end


  def show
    @order = Order.find_by :id => params[:id]
    @line_items = @order.line_items
    total = 0
    @line_items.each do |line_item|
      total+= line_item.sub_total.to_f
    end
    @order.total_price_cents = total
    @order.save
  end

  def destroy
    @order = Order.find_by :id => params[:id]
    @order.destroy
    redirect_to orders_path
  end


  private
  def order_params
    params.require(:order).permit(:category,:model,:quantity,:color,:brand,:email,:status,:payment_method,:total_price_cents)
  end

  def total_amount
    @line_items = @order.line_items
    @total = 0
    @line_items.each do |line_item|
      @total+= line_item.total_price
    end
  end

  def check_quantity(order)
    count =0
    approval_flag = false
    order.line_items.each do |line_item|
      if line_item.product.num_of_pieces > line_item.quantity
        count= count+1
      end
    end
    if count == order.line_items.count
      approval_flag = true
    else
      approval_flag = false
    end
  end

  def update_quantity(order)
    order.line_items.each do |line_item|
      line_item.product.num_of_pieces = line_item.product.num_of_pieces - line_item.quantity
      line_item.product.save
    end

  end

  def check_user
    flash[:notice] = 'Please login' unless @current_user.present?
    redirect_to root_path unless @current_user.present?
  end


end
