# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  model_num     :string
#  price         :decimal(, )
#  num_of_pieces :integer
#  brand         :string
#  color         :string
#  mfg_date      :date
#  image         :text
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  category      :string
#  price_cents   :integer          default(0), not null
#  active        :boolean          default(TRUE)
#

class Product < ActiveRecord::Base
  has_one :line_item
  register_currency :CAD
  monetize :price_cents, :allow_nil => true

  def money_in(currency)
    Money.new(price_cents, "USD").exchange_to(currency)
  end

end
