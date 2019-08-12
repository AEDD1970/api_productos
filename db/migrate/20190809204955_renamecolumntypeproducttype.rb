class Renamecolumntypeproducttype < ActiveRecord::Migration[5.2]
  def change
    rename_column :type_products, :type, :nametype

  end
end
