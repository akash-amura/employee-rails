require "rails_helper"

RSpec.describe Address, :type => :model do
  it "find emp in a city" do
    a = Address.where("city LIKE %","New%").count
    expect(a).to eq(3)
  end
end
