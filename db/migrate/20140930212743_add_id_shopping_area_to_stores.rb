class AddIdShoppingAreaToStores < ActiveRecord::Migration
  def change
    add_column :stores, :id_shopping_area, :integer
  end
end
