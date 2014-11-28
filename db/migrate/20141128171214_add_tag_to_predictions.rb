class AddTagToPredictions < ActiveRecord::Migration
  def change
    add_column :predictions, :tag, :string, :null => false, :default => ""
  end
end
