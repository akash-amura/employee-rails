class Company < ActiveRecord::Base
  self.primary_key = "company_id"
  has_many :employees
  has_many :addresses, as: :addressable
  validates :name, presence: true
  validates :domain, presence: true
  validates :company_type, presence: true
  validates_associated :employees
end
