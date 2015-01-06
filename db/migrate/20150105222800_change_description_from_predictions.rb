class ChangeDescriptionFromPredictions < ActiveRecord::Migration
  def up
    change_column :predictions, :description, :text
    change_column :predictions, :result, :text
  end

  def down
  end
end
