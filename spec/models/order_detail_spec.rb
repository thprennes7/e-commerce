require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  #Create class instances
  before(:all) do
  @user  = FactoryBot.create(:user)
  @item  = FactoryBot.create(:item)
  @order  = FactoryBot.create(:order)
  @order_detail  = FactoryBot.create(:order_detail)
  end
  #We test a validation to see if OrderDetail is present.
  context "validation" do
    it "is valid with valid attributes" do
      expect(@order_detail).to be_a(OrderDetail)
      expect(@order_detail).to be_valid
    end
  end
  #We check that the two instances team up well.
  context "associations" do
    it { should belong_to (:item) }
    it { should belong_to (:order) }
  end

end
