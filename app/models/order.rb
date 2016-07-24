# == Schema Information
#
# Table name: orders
#
#  id                :integer          not null, primary key
#  status            :string           default("new")
#  payment_method    :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  total_price       :float
#  total_price_cents :integer          default(0), not null
#

class Order < ActiveRecord::Base
  has_many :line_items
  belongs_to :user
  monetize :total_price_cents, :allow_nil => true

  #validates :payment_method, presence: true
  def total_in(currency)
    Money.new(total_price_cents, "USD").exchange_to(currency)
  end
end
