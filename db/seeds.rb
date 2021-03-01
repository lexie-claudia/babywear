# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

 p 'database cleared'
 p "--------------------------------"

Article.destroy_all

10.times do
    article = Article.new(
      name: Faker::Name.name,
      gender: Article::GENDER.sample,
      size: Article::SIZE.sample,
      price_per_month: [5, 10, 15, 20].sample,
      details: Faker::TvShows::BigBangTheory.quote,
      user: User.first
    )
    file = URI.open('https://images.unsplash.com/photo-1594726648897-f970a4907b98?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80')
    article.photos.attach(io: file, filename: 'baby.img', content_type: 'image/png')
    article.save
end
  p "--------------------------------"
  p '10 articles created'
