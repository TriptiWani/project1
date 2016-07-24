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
#  active          :boolean          default(TRUE)
#  currency        :string           default("AUD")
#

class User < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  validates :dob, :presence => true
  validates :gender , :presence => true
  validates :phone_number, :presence => true, :length => { :is => 9}
  # validates :password, :format => {:with => /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$/, message: "must be at least 6 characters and include one number and one letter."}

  has_many :orders

  def active_order
    order = self.orders.find_by :status => 'new'
    order = self.orders.create if order.nil?
    order
  end
end
