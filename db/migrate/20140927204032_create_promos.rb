class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.string :name
      t.text :description
      t.integer :id_marca
      t.integer :id_tienda

      t.timestamps
    end
  end
end
