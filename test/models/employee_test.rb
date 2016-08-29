require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  #
  def setup
    @employee = Employee.new(name:Faker::Name.name,email: Faker::Internet.email, phone:Faker::PhoneNumber.phone_number,employee_id:SecureRandom.uuid,salary:Random.new.rand(1..50000000),designation:Faker::Company.profession)
  end

  test "validity of name" do
    invalid_names = ["12321312","",nil,"Mr.aks@!#%$*&"]
    valid_names = ["mr. xyz","MR. XYZ ABC","XYZ abc"]

    invalid_names.each do |name|
      @employee.name = name 
      assert_not @employee.valid?,"Passes the test"
    end

    valid_names.each do |name|
      @employee.name = name
      assert @employee.valid?,"Does not pass the test:#{name}\nErrors:#{@employee.errors.full_messages}"
    end
  end

  test "validity of email" do
    invalid_emails = ["asv","asd@","asd.com",".com","",nil]
    valid_emails = ["akash.s@gmail.com","adsad@gmail.co.in"]

    invalid_emails.each do |email|
      @employee.email = email
      assert_not @employee.valid?
    end

    valid_emails.each do |email|
      @employee.email = email
      assert @employee.valid?
    end
  end

  test "validity of phone" do
    invalid_phones = ["1321sadsa","dsadqwe","123-dsadsa....."]
    valid_phones = ["333-333-3333","(333) 333-3333","1-333-333-3333","333.333.3333","333-333-3333","333-333-3333 x3333","(333) 333-3333 x3333","1-333-333-3333 x3333","333.333.3333 x3333"]
    invalid_phones.each do |phone|
      @employee.phone = phone
      assert_not @employee.valid?
    end
    valid_phones.each do |phone|
      @employee.phone = phone
      assert @employee.valid?
    end
  end

  test "validity of salary" do
    invalid_salaries = [0,-1,-999999]

    invalid_salaries.each do |salary|
      @employee.salary = salary 
      assert_not @employee.valid?
    end
    
  end
end
