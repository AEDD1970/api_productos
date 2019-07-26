class AddImageProducts < ActiveRecord::Migration[5.2]
  def up
    add_column :products, :image, :string
  end

  def down
    remove_column :products, :image
  end

end

