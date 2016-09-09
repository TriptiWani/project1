class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    params[:product][:price_cents] = (params[:product][:price_cents]).to_f * 100
    if (params[:product][:category].eql?'Handset')
      @product = Handset.new products_params
    elsif (params[:product][:category].eql?'Accessory')
      @product = Accessory.new products_params
    end
    # @product = Product.new products_params
    # @product.price_cents = 100 * @product.money_in_usd('USD')
    @product.price_cents = 100 * @product.price_cents
    if @product.save
      if (params[:photos]).present?
        # This is the magic stuff that will let us upload an image to Cloudinary when creating a new product.
        params[:photos].each do |photo|
          req = Cloudinary::Uploader.upload(photo)
          img = Image.create(:url => req["url"])
          @product.images << img
        end
      end
      @admin = User.find_by(:admin => true)
      UserMailer.product_added(@product,@admin).deliver_now
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find_by :id => params[:id]
    # binding.pry
    @product.price_cents = @product.money_in(@current_user.currency)
  end

  def update
    @product = Product.find_by :id => params[:id]
    # if (params[:file]).present?
    #   req = Cloudinary::Uploader.upload(params[:file])
    #   @product.image = req["url"]
    # end
    if (params[:photos]).present?
      params[:photos].each do |photo|
        req = Cloudinary::Uploader.upload(photo) # This is the magic stuff that will let us upload an image to Cloudinary when creating a new product.
        img = Image.create(:url => req["url"])
        @product.images << img
      end
    end
    @product.price_cents = @product.price_cents.to_f * 100
    if @product.type.present?
      binding.pry
      @product.update products_params(@product.type.downcase.to_sym)
    else
      binding.pry
      @product.update products_params
    end

    redirect_to product_path(@product[:id])
  end

  def show
    @product = Product.find params[:id]
  end

  def index
    if params[:productsearch].present?
      @products = Product.where('model_num ILIKE ?', '%' + params[:productsearch] + '%')
    elsif params[:category]
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
  def products_params(params_product='')
    if params_product.eql?''
      params.require(:product).permit(:model_num,:price_cents,:num_of_pieces,:brand,:color,:mfg_date,:category,:type)

    else
      params.require(params_product).permit(:model_num,:price_cents,:num_of_pieces,:brand,:color,:mfg_date,:category,:type)
    end
  end

end
