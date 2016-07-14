class LineItemsController < ApplicationController
  before_action :check_user
  
  def total_price
    unit_price * quantity
  end


  def index
    order_id = params[:order_id]
    @line_items = LineItem.where(:order_id=>order_id)
  end

  def new
    if @current_user.present?
      @line_item  = LineItem.new
      @product = Product.find(params[:product_id])
      @order = @current_user.active_order
    else
      flash[:notice] = 'Please login to add to cart'
      redirect_to root_path
    end
  end

  def create
    @line_item = LineItem.create line_item_params
    @order = @current_user.active_order
    @line_item.sub_total = subtotal(@line_item.quantity,@line_item.product.price.to_f)
    @line_item.save
    redirect_to order_list_path(@order.id)
  end

  # def create
  #
  #  @line_item = @order.line_items.new(line_item_params)
  #  @order.save
  #  session[:order_id] = @order.id
  #
  # end

  def edit


  end

  def update
    @order = current_order
    @line_item = @order.line_items.find(params[:id])
    @line_item.update_attributes(line_item_params)
    @line_items = @order.line_items
  end

  def show
    @line_item = LineItem.find_by :id => params[:id]
  end

  def destroy
    @order = current_order
    @line_item = @order.line_items.find(params[:id])
    @line_item.destroy
    @line_items = @order.line_items
  end

  private
  def line_item_params
    params.require(:line_item).permit(:quantity,:product_id,:order_id)
  end


  def current_order
    if !session[:order_id].nil?
      @current_order = Order.find(session[:order_id])
    else
      @current_order = Order.new
    end
  end

  def subtotal(quantity,price)
    subtotal = (quantity.to_f)*(price.to_f)
  end

  def check_user
    flash[:notice] = 'Please login' unless @current_user.present?
    redirect_to root_path unless @current_user.present?
  end

end
