class CreateFootballCamps < ActiveRecord::Migration
  def change
    create_table :football_camps do |t|
      t.string :offensive_position
      t.string :defensive_position
      t.string :name
      t.text :st_adreess
      t.string :city
      t.string :parent_name
      t.string :phone_number
      t.string :em_phone_number
      t.string :age_and_grade
      t.string :email_address
      t.integer :user_id
      t.boolean :tos_payment
      t.string :tshirt_size
      t.timestamps null: false
    end
  end
end
