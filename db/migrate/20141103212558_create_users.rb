class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :notifications_code

      t.timestamps
    end
  end
end
