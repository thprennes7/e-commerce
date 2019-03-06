class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@orders = Order.where(user_id: @user.id)
	end
end
