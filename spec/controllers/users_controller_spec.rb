require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:all) do
    let(:user){
    @user = FactoryBot.create(:user)
  }
  end
    describe "GET index" do
      it "expect users" do
      expect(@user).to eq(@user)
      expect(@user.email).to eq(@user.email)
      expect(@user.last_name).to eq(@user.last_name)
      end
    end
end
