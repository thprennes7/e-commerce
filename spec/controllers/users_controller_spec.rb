require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:all) do
    @user = FactoryBot.create(:user)
  end
  describe "GET show" do
    it "renders the show template" do
      get :show, id: @user.id
       expect(assigns(:user)).to eq(@user.id)
    end

    it "return http sucess" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end
