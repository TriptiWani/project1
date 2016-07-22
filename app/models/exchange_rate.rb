# == Schema Information
#
# Table name: exchange_rates
#
#  id         :integer          not null, primary key
#  currency   :string
#  rates      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ExchangeRate < ActiveRecord::Base

end
