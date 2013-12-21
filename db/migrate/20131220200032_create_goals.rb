class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name, :null => false
      t.date :end_date
      t.date :start_date
      t.integer :owner_id, :null => false
      t.integer :public, :default => 1
      t.integer :completed, :default => 0

      t.timestamps
    end
    add_index :goals, :owner_id
  end
end
