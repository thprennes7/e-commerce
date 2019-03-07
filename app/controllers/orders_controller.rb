class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
		@items = Cart.where(user_id: current_user.id)
    @amount = total_price(@items)

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    order = Order.new(stripe_customer_id: customer.id, user_id: current_user.id)
    if order.save
    	redirect_to cart_path(current_user.id)

    	@cart_array = Array.new

    	@items.each do |item|
    		id = item.item.id
      
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
          	@cart_array << {id: id, title: item.item.title, price: item.item.price, qty: 1}  
        	end
      	else
        	@cart_array << {id: id, title: item.item.title, price: item.item.price, qty: 1}
     		end
    	end

    	@cart_array.each do |item|
    		OrderDetail.create!(order_id: order.id, item_id: item[:id], price: item[:price], quantity: item[:qty])
    	end

    	@items.each do |item|
    		item.destroy
    	end

    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to cart_path(current_user.id)
  end

  def show
    @order = Order.find(params[:id])

    @items = OrderDetail.where(order_id: @order.id)
  end
end
