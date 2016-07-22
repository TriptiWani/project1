class PagesController < ApplicationController
  def home
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
