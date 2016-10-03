class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
	  t.references :cart, index: true
	  t.decimal :price
	  t.string :name
      t.timestamps
    end
  end
end
