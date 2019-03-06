class Order < ApplicationRecord
  belongs_to :user
  has_many :items, through: :order_detail
end
