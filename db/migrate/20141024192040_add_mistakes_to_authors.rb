class AddMistakesToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :mistakes, :integer, :null => false, :default => 0
  end
end
