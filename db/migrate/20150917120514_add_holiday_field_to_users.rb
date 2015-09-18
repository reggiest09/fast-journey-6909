class AddHolidayFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :holiday, :integer
  end
end
