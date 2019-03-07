require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  before(:all) do
  @user  = FactoryBot.create(:user)
  @item  = FactoryBot.create(:item)
  @cart  = FactoryBot.create(:cart)
  end
  describe "GET show" do
    it "expect catrs" do
      get :show, params: {id: @cart}
        expect(@cart).to eq(@cart)
    end
  end
end
