class AddCompetitionToDesigns < ActiveRecord::Migration[5.0]
  def change
    add_column :designs, :competition, :string
  end
end
