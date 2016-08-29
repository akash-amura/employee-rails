class ChangeAddressableIdInAddresses < ActiveRecord::Migration
  def change
    change_column :addresses,:addressable_id,:string,index:true
  end
end
