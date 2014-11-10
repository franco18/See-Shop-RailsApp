class RenameColumnsInPromoAndStore < ActiveRecord::Migration
  def change
    rename_column :stores, :id_shopping_area, :shopping_area_id
    rename_column :promos, :id_brand, :brand_id
  end
end
