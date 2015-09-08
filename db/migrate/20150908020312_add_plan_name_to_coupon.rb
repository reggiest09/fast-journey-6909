class AddPlanNameToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :plan_name, :string
    add_column :coupons, :plan, :string
  end
end
