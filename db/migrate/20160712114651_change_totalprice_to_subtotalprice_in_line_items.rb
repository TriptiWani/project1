class ChangeTotalpriceToSubtotalpriceInLineItems < ActiveRecord::Migration
  def change
    rename_column :line_items, :total_price, :sub_total
  end
end
