class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @items = Cart.where(user_id: current_user.id)
    @user = current_user
  end
end
