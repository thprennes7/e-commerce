class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
		@items = Cart.where(user_id: current_user.id)
    @amount = PriceService.new.total_price(@items)

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })

    order = Order.new(stripe_customer_id: customer.id, user_id: current_user.id)
    if order.save
    	redirect_to cart_path(current_user.id)
    end


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to cart_path(current_user.id)
  end
end
