class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  validates :city, presence:true, format:{ with: /\A[a-zA-Z]+\z/ }
  validates :country, presence:true, format:{ with: /\A[a-zA-Z]+\z/ }
  validates :state,presence:true, format:{ with: /\A[a-zA-Z]+\z/ }
end
