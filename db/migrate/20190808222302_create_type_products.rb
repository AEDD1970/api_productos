class CreateTypeProducts < ActiveRecord::Migration[5.2]
  def up
    create_table :type_products do |t|
      
      t.string :type

      t.timestamps
    end
    def down
     drop_table :type_products
    end
   
  end
end
