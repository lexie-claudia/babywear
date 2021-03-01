# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
 p 'database cleared'
 p "--------------------------------"

Article.destroy_all

10.times do
  p Article.create(
    name: Faker::Name.name,
    gender: Article::GENDER.sample,
    size: Article::SIZE.sample,
    price_per_month: [5, 10, 15, 20].sample,
    details: Faker::TvShows::BigBangTheory.quote,
    user: User.first
  )
end
  p "--------------------------------"
  p '10 articles created'
