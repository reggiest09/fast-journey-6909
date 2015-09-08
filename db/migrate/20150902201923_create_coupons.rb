class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :coupon_code
      t.integer :user_id
      t.integer :subscription_id

      t.timestamps null: false
    end
  end
end
