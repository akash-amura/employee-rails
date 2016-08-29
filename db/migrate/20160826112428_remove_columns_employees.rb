class RemoveColumnsEmployees < ActiveRecord::Migration
  def change
    remove_column :employees,:salary
    remove_column :employees,:designation
  end
end
