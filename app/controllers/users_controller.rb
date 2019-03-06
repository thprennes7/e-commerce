class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		#We are looking for the id of a particular user.
		@user = User.find(params[:id])
		#We retrieve all the id users and then retrieve the parameters of order.
		@orders = Order.where(user_id: @user.id)
	end
end
