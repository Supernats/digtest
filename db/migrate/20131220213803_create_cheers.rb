class CreateCheers < ActiveRecord::Migration
  def change
    create_table :cheers do |t|
      t.integer :cheerleader_id, :null => false
      t.integer :goal_id, :null => false

      t.timestamps
    end
    add_index :cheers, :cheerleader_id
  end
end
