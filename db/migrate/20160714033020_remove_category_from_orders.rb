class RemoveCategoryFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :category, :string
    remove_column :orders, :email, :string
  end
end
