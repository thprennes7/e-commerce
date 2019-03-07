require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before(:all) do
    @user = FactoryBot.create(:user)
    @order = FactoryBot.create(:order)
  end
  describe "GET show" do
    it "expect order" do
      get :show, params: {id: @order}
        expect(@order).to eq(@order)
    end
  end
end
