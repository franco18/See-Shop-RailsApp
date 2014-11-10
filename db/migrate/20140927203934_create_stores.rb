class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :id_marca

      t.timestamps
    end
  end
end
