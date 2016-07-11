class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    # raise "help"
  end

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

  def show
    @order = Order.find_by :id => params[:id]
  end

  def destroy
    @order = Order.find_by :id => params[:id]
    @order.destroy
    redirect_to orders_path
  end

  private
  def order_params
    params.require(:order).permit(:category,:model,:quantity,:color,:brand,:email,:status,:payment_method)
  end

end
