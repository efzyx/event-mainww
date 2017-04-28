# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
  email: 'efzet@mainww.sumbar',
  password: 'mypr1v@cy',
  password_confirmation: 'mypr1v@cy'
)
user.save!

user = User.new(
  email: 'cinde@mainww.sumbar',
  password: 'cinde22@mainww',
  password_confirmation: 'cinde22@mainww'
)
user.save!

user = User.new(
  email: 'frodo@mainww.sumbar',
  password: 'frodo33@mainww',
  password_confirmation: 'frodo33@mainww'
)
user.save!

user = User.new(
  email: 'ilham@mainww.sumbar',
  password: 'ilham11@mainww',
  password_confirmation: 'ilham11@mainww'
)
user.save!

user = User.new(
  email: 'yumi@mainww.sumbar',
  password: 'yumi44@mainww',
  password_confirmation: 'yumi44@mainww'
)
user.save!
user = User.new(
  email: 'aleppo@mainww.sumbar',
  password: 'aleppo55@mainww',
  password_confirmation: 'aleppo55@mainww'
)
user.save!