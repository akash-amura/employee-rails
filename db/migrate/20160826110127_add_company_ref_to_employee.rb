class AddCompanyRefToEmployee < ActiveRecord::Migration
  def change
    add_reference :employees, :company, index: true, foreign_key: true
  end
end
