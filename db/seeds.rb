# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

require 'securerandom'


def generate_companies(company_count=5)
  company_count.times do
    company = Company.new(company_id:SecureRandom.uuid,name:Faker::Company.name,domain:Faker::Company.buzzword,company_type:Faker::Company.suffix,description:Faker::Company.catch_phrase)
    company.save!
  end
end

def generate_employees(emp_count=10)
  companies = Company.all
  emp_count.times do
    companies[Random.new.rand(companies.length)].employees.create(name:Faker::Name.name,email: Faker::Internet.email, phone:Faker::PhoneNumber.phone_number,employee_id:SecureRandom.uuid,salary:Random.new.rand(1..50000000),designation:Faker::Company.profession)
  end
end

def generate_address(class_name)
  objects = class_name.all
  objects.each do |o|
    Random.new.rand(5).times do
    o.addresses.create(city:Faker::Address.city,street_name:Faker::Address.street_name,secondary_address:Faker::Address.secondary_address,street_address:Faker::Address.street_address,building_number:Faker::Address.building_number,zip_code:Faker::Address.zip_code,state:Faker::Address.state,country:Faker::Address.country,latitude:Faker::Address.latitude,longitude:Faker::Address.longitude) 
    end
  end
end


generate_companies
generate_employees
generate_address(Employee)
generate_address(Company)
