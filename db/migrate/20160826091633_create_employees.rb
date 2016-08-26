class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees,id: false do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :employee_id, null:false

      t.timestamps null: false
    end
  end
end
