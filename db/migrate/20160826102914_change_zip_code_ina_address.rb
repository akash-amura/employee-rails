class ChangeZipCodeInaAddress < ActiveRecord::Migration
  def change
    change_column :addresses,:zip_code,:integer,:limit => 8
  end
end
