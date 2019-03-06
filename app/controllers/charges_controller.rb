class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
    @items = Cart.where(user_id: current_user.id)
    @order_price = 0.0
    @items.each do |item|
      @order_price += (item.price * item.quantity)
    end
    @order_price = @order_price * 100
  end

  def create
    @items = Cart.where(user_id: current_user.id)
    @amount = 0.0
    @items.each do |item|
      @amount += (item.price * item.quantity)
    end
    @amount = @amount * 100

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



    order_send(@user, @item)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
