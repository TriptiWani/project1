class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new products_params
    if (params[:file]).present?
      req = Cloudinary::Uploader.upload(params[:file])
      @product.image = req["url"]
    end
    if @product.save
      @admin = User.find_by(:admin => true)
      UserMailer.product_added(@product,@admin).deliver_now
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
    if (params[:file]).present?
      req = Cloudinary::Uploader.upload(params[:file])
      @product.image = req["url"]
    end
    @product.update products_params

    redirect_to product_path(@product[:id])
  end

  def show
    @product = Product.find params[:id]
  end

  def index
    if params[:category]
      @products = Product.where(:category => params[:category] , :active => true )
    else
      @products = Product.where(:active => true ).order('id ASC')
    end
    @line_item = current_order.line_items.new
  end

  def destroy
    @product = Product.find_by :id => params[:id]
    @product.active = false
    @product.save

    redirect_to products_path
  end

  private
  def products_params
    params.require(:product).permit(:model_num,:price_cents,:num_of_pieces,:brand,:color,:mfg_date,:image,:category)
  end

end
