class ChangeSubtotalInProducts < ActiveRecord::Migration
  def change
    add_monetize :line_items, :sub_total, currency: { present: false }
    add_monetize :orders, :total_price, currency: { present: false }
  end
end
