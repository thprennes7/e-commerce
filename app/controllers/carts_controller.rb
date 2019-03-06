class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
  	@cart = Cart.where(user_id: current_user.id)

  	@cart_price = 0
  	@cart.each do |cart_item|
  		@cart_price += cart_item.item.price
  	end
  end

  def destroy
  	cart_item = Cart.find_by(user_id: current_user.id, item_id: params[:id])

  	if cart_item.destroy
  		respond_to do |format|
				format.html { redirect_to cart_path(current_user.id)}
				format.js
			end
		end
  end
end

