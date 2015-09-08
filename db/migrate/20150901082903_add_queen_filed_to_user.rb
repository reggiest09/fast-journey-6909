class AddQueenFiledToUser < ActiveRecord::Migration
  def change
    add_column :users, :employee_qc, :boolean
  end
end
