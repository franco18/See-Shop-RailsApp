class AddWebPageAndNitAndPhoneToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :web_page, :string
    add_column :brands, :nit, :string
    add_column :brands, :phone, :string
  end
end
