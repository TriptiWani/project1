# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  category       :string
#  model          :string
#  quantity       :integer
#  color          :string
#  brand          :string
#  email          :text
#  status         :string
#  payment_method :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Order < ActiveRecord::Base
  has_many :line_items
  belongs_to :user
end
