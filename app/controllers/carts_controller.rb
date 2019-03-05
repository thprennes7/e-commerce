class CartsController < ApplicationController
	def show
		@user  = User.find(params[:id])
		@cart  = Cart.where(user_id: @user.id)
	end
end 