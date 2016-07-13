class RemoveColumnsFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :model
    remove_column :orders, :quantity
    remove_column :orders, :color
    remove_column :orders, :brand 
  end
end
