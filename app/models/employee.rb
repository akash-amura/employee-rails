class Employee < ActiveRecord::Base
 self.primary_key = 'employee_id'
 has_many :addresses, as: :addressable, primary_key: :employee_id
 belongs_to :company

 validates :name, presence:true, format:{with: /\A[a-zA-Z\s\.]+\z/,message:"Only allow letters and spaces"}

 validates :email, presence:true, format:{with: /\A.+?@.+?\..+?\z/}

 validates :phone, format:{with: /\A[0-9xX\.\(\)\-\s]+\z/}

 validates :salary, numericality:{ greater_than: 0}
end
