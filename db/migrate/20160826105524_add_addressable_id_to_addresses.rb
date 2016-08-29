class AddAddressableIdToAddresses < ActiveRecord::Migration
  def change
    add_reference :addresses, :addressable, index: true, foreign_key: true
  end
end
