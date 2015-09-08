class AddActiveCodeToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :active, :boolean, default: false
  end
end
