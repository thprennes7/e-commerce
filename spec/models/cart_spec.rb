require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  #Create class instances
  before(:all) do
    @user          = FactoryBot.create(:user)
    @cart          = FactoryBot.create(:cart)
    @item          = FactoryBot.create(:item)
    @order         = FactoryBot.create(:order)
    @order_detail  = FactoryBot.create(:order_detail)
  end

#We test a validation to see if cart is present.
  context "validation" do
    it "is valid with valid attributes" do
      expect(@cart).to be_a(Cart)
      expect(@cart).to be_valid
    end
  end

 #We check that the two instances team up well.
  context 'associations' do
#     it { should belong_to(:user) }      ybo: not association user ??
      it { should belong_to(:item) }
  end
end
