class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :todo_id
      t.string :description

      t.timestamps
    end
  end
end
