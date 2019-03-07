require 'rails_helper'

RSpec.describe User, type: :model do
  #Create class instances
  before(:all) do
    @user          = FactoryBot.create(:user)
    @cart          = FactoryBot.create(:cart)
    @item          = FactoryBot.create(:item)
    @order         = FactoryBot.create(:order)
    @order_detail  = FactoryBot.create(:order_detail)
  end
  #We test a validation to see if User is present.
  context "validation" do
    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end
  end
  #We check that the instance team up well.
  context 'associations' do
    it { should have_many(:orders) }
  end

end
