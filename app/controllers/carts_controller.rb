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
    @cart_hash = Hash.new
    @cart_array = Array.new
  	@cart_price = 0
  	@cart.each do |cart_item|
      id = cart_item.item.id
  		@cart_price += cart_item.item.price
      
      if @cart_array.any?
        # some condition and iterations to check if we have already the item in ur array to have quantity, x is an iterrator, and y will refer to the index
        x = 0
        y = 0
        @cart_array.each_with_index do |item, index|
          if item[:id] == id
            x = 1
            y = index
          end
        end
        if x == 1
          @cart_array[y][:qty] += 1
        else
          @cart_array << {id: id, title: cart_item.item.title, price: cart_item.item.price, qty: 1}  
        end
      else
        @cart_array << {id: id, title: cart_item.item.title, price: cart_item.item.price, qty: 1}
      end
    end
  end

  def destroy
  	cart_item = Cart.find_by(user_id: current_user.id, item_id: params[:id])

    @item = cart_item.item

  	if cart_item.destroy
  		redirect_to request.referer
		end
  end
end

