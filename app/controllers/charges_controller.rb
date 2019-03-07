class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
    @items = Cart.where(user_id: current_user.id)
    @order_price = PriceService.new.total_price(@items)
  end

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

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
