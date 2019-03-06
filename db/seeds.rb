# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Item.destroy_all
User.destroy_all
Cart.destroy_all
OrderDetail.destroy_all
Order.destroy_all

20.times do
  Item.create!(price: rand(10..50), description: Faker::Lorem.paragraph(9), title: Faker::Creature::Cat.breed, image_url: Faker::Avatar.image)
end

15.times do |i|
  User.create!(email: "thprennes#{i}@yopmail.com", password: Faker::Lorem.paragraph)
  i += 1
end

15.times do
  Cart.create!(user_id: User.all.sample.id, item_id: Item.all.sample.id)
end

25.times do
  Order.create!(user_id: User.all.sample.id, stripe_customer_id: SecureRandom.base64)
end

50.times do
  item = Item.all.sample
  OrderDetail.create!(order_id: Order.all.sample.id, item_id: item.id, price: item.price, quantity: Faker::Number.between(1, 5))
end

