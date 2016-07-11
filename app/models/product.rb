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
#  imei          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Product < ActiveRecord::Base
  has_one :line_item
end
