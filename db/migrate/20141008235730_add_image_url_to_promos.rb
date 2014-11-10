class AddImageUrlToPromos < ActiveRecord::Migration
  def change
    add_column :promos, :image_url, :string
  end
end
