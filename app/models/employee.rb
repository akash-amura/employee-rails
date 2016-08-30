class Employee < ActiveRecord::Base
 self.primary_key = 'employee_id'
 has_many :addresses, as: :addressable, primary_key: :employee_id
 belongs_to :company

 validates :name, presence:true, format:{with: /\A[a-zA-Z\s\.]+\z/,message:"Only allow letters and spaces"}
 validates :email, presence:true, format:{with: /\A.+?@.+?\..+?\z/},uniqueness: true
 validates :phone, format:{with: /\A[0-9xX\.\(\)\-\s]+\z/},uniqueness: true
 validates :salary, numericality:{ greater_than: 0}

 def self.all_employees_in_city(city)
   self.joins(:addresses).where("addresses.city = ?",city).pluck(:employee_id,:name,:city)
 end

 def self.search_employee_address_by_email(email)
   self.joins(:addresses).where(email:email).pluck(:employee_id,:name,:building_number,:street_name,:street_address,:secondary_address,:city,:zip_code,:state,:country,:latitude,:longitude).map do |entry| 
     address = entry[2..entry.length].join(',')
     entry[2] = address
     entry.slice!(0,3)
   end
 end

 def self.get_employees_in_salary_range(lower,upper)
   self.where(salary:lower..upper+1)
 end

end
