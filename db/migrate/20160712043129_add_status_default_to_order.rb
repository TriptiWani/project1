class AddStatusDefaultToOrder < ActiveRecord::Migration
  def change
    change_column :orders, :status, :string , default:'new'
  end
end
