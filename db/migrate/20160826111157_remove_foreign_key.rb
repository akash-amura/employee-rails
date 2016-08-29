class RemoveForeignKey < ActiveRecord::Migration
  def change
    remove_foreign_key :addresses, :addressable_id
  end
end
