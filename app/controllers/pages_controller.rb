class PagesController < ApplicationController
  def home
    redirect_to products_path
  end

  def products_home
  end

  def contact
  end

  def currency
    # currency_conversion('USD',params[])
    redirect_to  :back
  end
end
