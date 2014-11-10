class CreateStorePromos < ActiveRecord::Migration
  def change
    create_table :store_promos do |t|
      t.integer :id_store
      t.integer :id_promo
      t.integer :quantity

      t.timestamps
    end
  end
end
