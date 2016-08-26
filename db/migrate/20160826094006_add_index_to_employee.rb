class AddIndexToEmployee < ActiveRecord::Migration
  def change
    add_index :employees,:employee_id,unique:true
  end
end
