class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
   @cart  = Cart.where(user_id: current_user.id)
  puts "================================="
  puts @cart
  puts "================================="
  end

def create
  # Amount in cents
  @item = Item.find(params[:id])
  @amount = 500

  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'paiment',
    currency: 'eur',
  })

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end
  order_send(@user, @item)
end
