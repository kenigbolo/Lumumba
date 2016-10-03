class RemovePriceFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :price, :decimal
  end
end
