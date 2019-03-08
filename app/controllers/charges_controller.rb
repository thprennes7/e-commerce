class ChargesController < ApplicationController
  before_action :authenticate_user!
#A method related to stripe and cart.
  def new
    @items = Cart.where(user_id: current_user.id)
    @order_price = PriceService.new.total_price(@items)
  end
end
