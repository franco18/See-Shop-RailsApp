class AddImageUrlToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :image_url, :string
  end
end
