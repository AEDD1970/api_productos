class AddQuantityToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :quantiyy, :integer
  end
end
