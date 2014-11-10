class AddLongitudeAndLatitudeToStores < ActiveRecord::Migration
  def change
    add_column :stores, :longitude, :float
    add_column :stores, :latitude, :float
  end
end
