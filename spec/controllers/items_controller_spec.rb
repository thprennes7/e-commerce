require 'rails_helper'
require 'spec_helper'

RSpec.describe ItemsController, type: :controller do
  #Create class instances
  before(:all) do
    @user          = FactoryBot.create(:user)
    @cart          = FactoryBot.create(:cart)
    @item          = FactoryBot.create(:item)
    @order         = FactoryBot.create(:order)
    @order_detail  = FactoryBot.create(:order_detail)
  end
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(assigns(@item)).respond_to?(:items)
    end
  end
end
