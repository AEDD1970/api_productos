class DropTypePoductsTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :type_products
  end
end
