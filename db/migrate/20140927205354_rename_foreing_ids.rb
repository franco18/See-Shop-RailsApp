class RenameForeingIds < ActiveRecord::Migration
  def change
    rename_column :stores, :id_marca, :id_brand
    rename_column :promos, :id_marca, :id_brand
    rename_column :promos, :id_tienda, :id_store
  end
end
