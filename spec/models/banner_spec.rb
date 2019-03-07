require 'rails_helper'

RSpec.describe Item, type: :model do

  before(:all) do
    @user          = FactoryBot.create(:user)
    @cart          = FactoryBot.create(:cart)
    @item          = FactoryBot.create(:item)
    @order         = FactoryBot.create(:order)
    @order_detail  = FactoryBot.create(:order_detail)
    @banner        = FactoryBot.create(:banner)
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@banner).to be_a(Banner)
      expect(@banner).to be_valid
    end
  end


end