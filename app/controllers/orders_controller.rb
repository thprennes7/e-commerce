class OrdersController < ApplicationController
  before_action :authenticate_user!
end
