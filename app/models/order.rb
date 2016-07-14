# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  status         :string           default("new")
#  payment_method :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#  total_price    :float
#

class Order < ActiveRecord::Base
  has_many :line_items
  belongs_to :user

  #validates :payment_method, presence: true

end
