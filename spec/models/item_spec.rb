require 'rails_helper'

RSpec.describe Item, type: :model do
  #Create class instances
  before(:all) do
    @user          = FactoryBot.create(:user)
    @cart          = FactoryBot.create(:cart)
    @item          = FactoryBot.create(:item)
    @order         = FactoryBot.create(:order)
    @order_detail  = FactoryBot.create(:order_detail)
  end
  #We test a validation to see if Item is present.
  context "validation" do
    it "is valid with valid attributes" do
      expect(@item).to be_a(Item)
      expect(@item).to be_valid
    end
  end
  #We check that the two instances team up well.
  context "associations" do
#   it { should have_many(:orders).through(:order_detail) }         ybo: not association ??
    it { should have_many(:carts) }
#   it { should have_many(:order_details) }
  end
end
