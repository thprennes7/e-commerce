require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:all) do
    @user = FactoryBot.create(:user)
  describe "GET index" do
    it "assigns @users" do
      get :index
      expect(assigns(:users)).to eq(user)
    end

    it "renders the index template" do
      get :index
end
