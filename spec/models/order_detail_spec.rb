require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  before(:all) do
  @user  = FactoryBot.create(:user)
  @item  = FactoryBot.create(:item)
  @order  = FactoryBot.create(:order)
  @order_detail  = FactoryBot.create(:order_detail)
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@order_detail).to be_a(OrderDetail)
      expect(@order_detail).to be_valid
    end
  end

end
