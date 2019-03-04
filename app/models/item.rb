class Item < ApplicationRecord
  has_many :orders
  has_many :carts
  has_many :users, through: :order
end
