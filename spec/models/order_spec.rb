require 'rails_helper'

RSpec.describe Order, type: :model do

  before(:all) do
    @user          = FactoryBot.create(:user)
    @cart          = FactoryBot.create(:cart)
    @item          = FactoryBot.create(:item)
    @order         = FactoryBot.create(:order)
    @order_detail  = FactoryBot.create(:order_detail)
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@order).to be_a(Order)
      expect(@order).to be_valid
    end
  end


  context "associations" do
  	it { should belong_to (:user) }
#   it { should have_many(:items).through(:order_detail) }         ybo: not association ??         
    it { should have_many(:order_details) }
  end

end
