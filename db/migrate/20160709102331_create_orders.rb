class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :category
      t.string :model
      t.integer :quantity
      t.string :color
      t.string :brand
      t.text :email
      t.string :status
      t.string :payment_method

      t.timestamps null: false
    end
  end
end
