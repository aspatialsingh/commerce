class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :sku
      t.text :description
      t.string :warranty 
      t.float :cost_price
      t.float :retail_price
      t.float :sale_price
      t.boolean :visible
      t.float :weight

      t.timestamps
    end
  end
end
