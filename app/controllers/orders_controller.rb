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

    	@cart_array = items_array(@items)

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
