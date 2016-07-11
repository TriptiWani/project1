class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new products_params

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find_by :id => params[:id]
  end

  def update
    @product = Product.find_by :id => params[:id]
    @product.update products_params

    redirect_to product_path(@product[:id])
  end

  def show
    @product = Product.find params[:id]
  end

  def index
    @products = Product.all
  end

  def destroy
    @product = Product.find_by :id => params[:id]
    @product.destroy

    redirect_to products_path
  end

  private
  def products_params
    params.require(:product).permit(:model_num,:price,:num_of_pieces,:brand,:color,:mfg_date,:image)
  end

end
