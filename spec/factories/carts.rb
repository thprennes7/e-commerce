FactoryBot.define do
  factory :cart do
  	user_id { User.last.id }
  	item_id { Item.last.id }
  end
end
