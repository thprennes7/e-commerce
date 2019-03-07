FactoryBot.define do
  factory :order_detail do
  	order_id { Order.last.id }
  	item_id { Item.last.id }
  	price { 9.99 }
  	quantity { 2 }
  end
end

  