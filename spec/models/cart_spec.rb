require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  before(:all) do
    @user          = FactoryBot.create(:user)
    @cart          = FactoryBot.create(:cart)
    @item          = FactoryBot.create(:item)
    @order         = FactoryBot.create(:order)
    @order_detail  = FactoryBot.create(:order_detail)
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@cart).to be_a(Cart)
      expect(@cart).to be_valid
    end
  end

  context 'associations' do
#     it { should belong_to(:user) }      ybo: not association user ??
      it { should belong_to(:item) }
  end
end
