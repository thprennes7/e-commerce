require 'rails_helper'

RSpec.describe Order, type: :model do
  #Create class instances
  before(:all) do
    @user          = FactoryBot.create(:user)
    @cart          = FactoryBot.create(:cart)
    @item          = FactoryBot.create(:item)
    @order         = FactoryBot.create(:order)
    @order_detail  = FactoryBot.create(:order_detail)
  end
  #We test a validation to see if Order is present.
  context "validation" do
    it "is valid with valid attributes" do
      expect(@order).to be_a(Order)
      expect(@order).to be_valid
    end
  end

  #We check that the three instances team up well.
  context "associations" do
  	it { should belong_to (:user) }
#   it { should have_many(:items).through(:order_detail) }         ybo: not association ??
#    it { should have_many(:order_details) }
  end

end
