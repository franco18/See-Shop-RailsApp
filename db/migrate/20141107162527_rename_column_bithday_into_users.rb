class RenameColumnBithdayIntoUsers < ActiveRecord::Migration
  def change
    rename_column :users, :bithday, :birthday
  end
end
