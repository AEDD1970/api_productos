class DropProductsTable < ActiveRecord::Migration[5.2]
  def up 
    drop_table :products
  end
  def down
  end
end
