class CreateProducts < ActiveRecord::Migration[5.2]
  def up
    create_table :products do |t|
      t.string :producname
      t.belongs_to :type_product, foreign_key: true
      t.integer :price
      t.text :description

      t.timestamps
    end
    def down
    drop_table :products
     end
  end
end
