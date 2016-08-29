class Employee < ActiveRecord::Base
 self.primary_key = 'employee_id'
 has_many :addresses, as: :addressable, primary_key: :employee_id
 belongs_to :company
end
