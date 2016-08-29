class AddColumnsToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :salary,:float
    add_column :employees, :designation,:string
  end
end
