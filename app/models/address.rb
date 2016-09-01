class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  belongs_to :employees,class_name:"Employee",foreign_key: :addressable_id
  belongs_to :companies, class_name:"Company",foreign_key: :addressable_id
  validates :city, presence:true, format:{ with: /\A[a-zA-Z]+\z/ }
  validates :country, presence:true, format:{ with: /\A[a-zA-Z]+\z/ }
  validates :state,presence:true, format:{ with: /\A[a-zA-Z]+\z/ }
end
