FactoryBot.define do
  factory :order do
    user_id { User.last.id }
    stripe_customer_id { "MyString" }
  end
end
