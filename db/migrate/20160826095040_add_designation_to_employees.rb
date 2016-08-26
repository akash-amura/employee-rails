class AddDesignationToEmployees < ActiveRecord::Migration
  def change
    add_column :employees,:designation,:float
  end
end
