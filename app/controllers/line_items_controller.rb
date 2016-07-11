class LineItemsController < ApplicationController
  def index
    @line_items = LineItem.all
  end

  def new
    @line_item  = LineItem.new
  end

  def create
    @line_item = LineItem.create line_item_params
    redirect_to line_items_path
  end

  def edit


  end

  def show
    @line_item = LineItem.find_by :id => params[:id]
  end

  private
  def line_item_params
    params.require(:line_item).permit(:quantity)
  end

end
