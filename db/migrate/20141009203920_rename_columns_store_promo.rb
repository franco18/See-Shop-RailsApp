class RenameColumnsStorePromo < ActiveRecord::Migration
  def change
    rename_column :store_promos, :id_promo, :promo_id
    rename_column :store_promos, :id_store, :store_id
  end
end
