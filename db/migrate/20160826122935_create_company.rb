class CreateCompany < ActiveRecord::Migration
  def change
    create_table :companies,id:false do |t|
      t.string :company_id, null:false
      t.string :name 
      t.string :domain
      t.string :company_type
      t.text :description
    end

    add_index :companies, :company_id, unique:true 
  end
end
