# == Schema Information
#
# Table name: line_items
#
#  id              :integer          not null, primary key
#  product_id      :integer
#  order_id        :integer
#  quantity        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  sub_total       :float
#  sub_total_cents :integer          default(0), not null
#

class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  monetize :sub_total_cents, :allow_nil => true

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def sub_total_in(currency)
    Money.new(sub_total_cents, "USD").exchange_to(currency)
  end


end
