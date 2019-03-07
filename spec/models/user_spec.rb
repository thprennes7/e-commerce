require 'rails_helper'

RSpec.describe User, type: :model do

  before(:all) do
    @user          = FactoryBot.create(:user)
    @cart          = FactoryBot.create(:cart)
    @item          = FactoryBot.create(:item)
    @order         = FactoryBot.create(:order)
    @order_detail  = FactoryBot.create(:order_detail)
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end
  end

  context 'associations' do
    it { should have_many(:orders) }
    it { should have_many(:orders) }
  end

end