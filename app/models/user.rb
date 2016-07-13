# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  dob             :date
#  gender          :string
#  password_digest :string
#  phone_number    :string
#  address         :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean          default(FALSE)
#  image           :text
#

class User < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  validates :dob, :presence => true
  validates :gender , :presence => true
  validates :phone_number, :presence => true, :length => { :is => 9}

  has_many :orders

  def active_order
    order = self.orders.find_by :status => 'new'
    order = self.orders.create if order.nil?
    order
  end
end
