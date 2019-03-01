class AddInformationToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role, :string, default: "pending"
    add_column :users, :name, :string
    add_column :users, :join_date, :date
    add_column :users, :leave_date, :date
  end
end
