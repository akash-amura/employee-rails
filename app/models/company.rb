class Company < ActiveRecord::Base
  self.primary_key = "company_id"
  has_many :employees
  has_many :addresses, as: :addressable
  validates :name, presence: true
  validates :doman, presence: true
end
