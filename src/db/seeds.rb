# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
Order.destroy_all
User.destroy_all

user = User.create(email: 'foo@bar.com', password: 'password', password_confirmation: 'password')
user1 = User.create(email: 'bar@foo.com', password: 'password', password_confirmation: 'password')

user.items.create(
  [
    { name: 'harrows darts', condition: 'excellent', price: 30.00 },
    { name: 'harrows darts', condition: 'good', price: 15.00 }
  ]
)

user1_order = user1.orders.create
user1_order.items << Item.first
user1_order.save
