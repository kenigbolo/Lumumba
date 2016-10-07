class ChangeDatatypeForCompetitionInDesigns < ActiveRecord::Migration[5.0]
  def change
  	change_column :designs, :competition, :boolean
  end
end
