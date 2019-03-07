class Item < ApplicationRecord
  has_many :orders, through: :order_detail
  has_many :carts
  has_one_attached :cat_picture
  has_many :order_details
end
