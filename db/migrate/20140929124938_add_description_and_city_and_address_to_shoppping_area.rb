class AddDescriptionAndCityAndAddressToShopppingArea < ActiveRecord::Migration
  def change
    add_column :shopping_areas, :description, :string
    add_column :shopping_areas, :city, :string
    add_column :shopping_areas, :address, :string
  end
end
