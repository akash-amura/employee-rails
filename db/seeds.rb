# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

require 'securerandom'
employee = Employee.new(name:Faker::Name.name,email: Faker::Internet.email, phone:Faker::PhoneNumber.phone_number,employee_id:SecureRandom.uuid)
employee.save!
