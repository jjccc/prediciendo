class AddSlugToPredictions < ActiveRecord::Migration
  def change
    add_column :predictions, :slug, :string
    add_index :predictions, :slug
  end
end
