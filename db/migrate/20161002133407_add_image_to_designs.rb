class AddImageToDesigns < ActiveRecord::Migration[5.0]
  def change
    add_column :designs, :image, :string
  end
end
