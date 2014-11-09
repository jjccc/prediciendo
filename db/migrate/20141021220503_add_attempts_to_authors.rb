class AddAttemptsToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :attempts, :integer, :null => false, :default => 0
  end
end
