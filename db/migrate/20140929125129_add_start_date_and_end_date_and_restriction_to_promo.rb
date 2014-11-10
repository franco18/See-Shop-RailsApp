class AddStartDateAndEndDateAndRestrictionToPromo < ActiveRecord::Migration
  def change
    add_column :promos, :start_date, :date
    add_column :promos, :end_date, :date
    add_column :promos, :restriction, :string
  end
end
