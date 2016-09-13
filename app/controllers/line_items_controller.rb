class LineItemsController < ApplicationController
  before_action :check_user

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
    @order = @current_user.active_order
    prod_id = (params[:line_item][:product_id]).to_i
    check_if_product_already_exists(@order,prod_id)
    @line_item.sub_total_cents = subtotal(@line_item.quantity,@line_item.product.price_cents.to_f)
    @line_item.save
    redirect_to order_list_path(@order.id)
  end

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
    @line_item = LineItem.find(params[:id])
    @order = Order.find(@line_item.order.id)
    @line_item.destroy

    redirect_to @order
  end

  private
  def check_if_product_already_exists(order,prod_id)
    @order = order
    prods = @order.line_items.pluck(:product_id)
    prod_id = (params[:line_item][:product_id]).to_i

    if prods.index(prod_id).present?
      @line_item = @order.line_items[prods.index(prod_id)]
      @line_item.quantity+= (params[:line_item][:quantity]).to_i
      @line_item.save
    else
      @line_item = LineItem.create line_item_params
    end
  end
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
