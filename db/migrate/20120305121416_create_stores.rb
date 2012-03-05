class CreateStores < ActiveRecord::Migration
  def up
    create_table :stores do |t|
      t.string :name
      t.integer :user_id
      t.boolean :suspended
      t.boolean :deleted

      t.timestamps
    end
  
  end
  
  def down
    drop_table :stores
  end
end
