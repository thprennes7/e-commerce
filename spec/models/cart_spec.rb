require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  before(:all) do
  @user  = FactoryBot.create(:user)
  @item  = FactoryBot.create(:item)
  @cart  = FactoryBot.create(:cart)
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@cart).to be_a(Cart)
      expect(@cart).to be_valid
    end
  end

end
