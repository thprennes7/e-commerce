require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
   before(:all) do
  @order_detail  = FactoryBot.create(:order_detail)
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@order_detail).to be_a(Order_detail)
      expect(@order_detail).to be_valid
    end
  end

end
