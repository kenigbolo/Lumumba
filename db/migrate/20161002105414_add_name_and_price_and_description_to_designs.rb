class AddNameAndPriceAndDescriptionToDesigns < ActiveRecord::Migration[5.0]
  def change
    add_column :designs, :name, :string
    add_column :designs, :price, :decimal
    add_column :designs, :description, :string
  end
end
