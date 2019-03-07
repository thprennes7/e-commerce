class CartsController < ApplicationController
  before_action :authenticate_user!

  def create
    cart_item = Cart.new(user_id: current_user.id, item_id: params[:item])

    if cart_item.save
      redirect_to cart_path(current_user.id)
    end

  end

  def show
  	@cart = Cart.where(user_id: current_user.id)
    @cart_array = items_array(@cart)
  	@cart_price = total_price(@cart)
  end

  def destroy
  	cart_item = Cart.find_by(user_id: current_user.id, item_id: params[:id])

    @item = cart_item.item

  	if cart_item.destroy
  		redirect_to request.referer
		end
  end
end
