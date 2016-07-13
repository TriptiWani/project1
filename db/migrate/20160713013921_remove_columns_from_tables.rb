class RemoveColumnsFromTables < ActiveRecord::Migration
  def change
    remove_column :line_items, :unit_price
    remove_column :products, :imei 
  end
end
