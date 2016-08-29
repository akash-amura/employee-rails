class RemoveColumnsFromAddress < ActiveRecord::Migration
  def change
    remove_column :addresses,:time_zone

    remove_column :addresses,:street_suffix

    remove_column :addresses,:city_suffix

    remove_column :addresses,:city_prefix

    remove_column :addresses,:state_abbr

    remove_column :addresses,:country_code
  end
end
