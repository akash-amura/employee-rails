class AddSalaryToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :salary, :float
  end
end
