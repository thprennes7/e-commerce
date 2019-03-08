require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before(:all) do
    @user = FactoryBot.create(:user)
    @order = FactoryBot.create(:order)
  end
  describe "GET show" do
    it "respond_to order" do
      get :show, params: {id: @order}
        expect(assigns(@order)).respond_to?(:orders)
    end
    it "expect order" do
      expect(@order).to eq(@order)
    end
  end
end
