class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :model_num
      t.decimal :price
      t.integer :num_of_pieces
      t.string :brand
      t.string :color
      t.date :mfg_date
      t.text :image
      t.string :type
      t.string :imei

      t.timestamps null: false
    end
  end
end
