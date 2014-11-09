class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
      t.integer :author_id, :null => false
      t.string :description, :null => false
      t.string :result, :null => true
      t.boolean :is_pending, :null => false, :default => true
      t.boolean :is_success, :null => true
      t.date :due_date, :null => false

      t.timestamps
    end
  end
end
