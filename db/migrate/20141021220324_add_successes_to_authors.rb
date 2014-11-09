class AddSuccessesToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :successes, :integer, :null => false, :default => 0
  end
end
