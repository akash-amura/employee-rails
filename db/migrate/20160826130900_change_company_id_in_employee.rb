class ChangeCompanyIdInEmployee < ActiveRecord::Migration
  def change
    change_column :employees,:company_id,:string,index:true,foreign_key:true
  end
end
