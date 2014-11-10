class AddFacebookIdAndEmailAndBirthdayAndGenderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_id, :string
    add_column :users, :email, :string
    add_column :users, :bithday, :date
    add_column :users, :gender, :string
  end
end
