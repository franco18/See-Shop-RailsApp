class AddPhoneAndEmailAndAddressToStore < ActiveRecord::Migration
  def change
    add_column :stores, :phone, :string
    add_column :stores, :email, :string
    add_column :stores, :address, :string
  end
end
