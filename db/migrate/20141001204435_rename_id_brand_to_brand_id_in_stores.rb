class RenameIdBrandToBrandIdInStores < ActiveRecord::Migration
  def change
    rename_column :stores, :id_brand, :brand_id
  end
end
