class AddCurrencyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :currency, :string,  default:'AUD'
  end
end
