class CreateMails < ActiveRecord::Migration
  def change
    create_table :mails do |t|
      t.string :result

      t.timestamps
    end
  end
end
