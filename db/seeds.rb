# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

puts "Cleaning existing bookings..."
Booking.destroy_all
puts "Cleaning existing articles..."
Article.destroy_all

puts "Generating sample articles..."
PHOTOS = ["https://images.unsplash.com/photo-1525107372716-1a85946c5dff?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mjl8fGJhYnklMjBjbG90aGVzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1594726648897-f970a4907b98?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80", "https://images.unsplash.com/photo-1610620664223-9140ea87c18e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzR8fGJhYnklMjBjbG90aGVzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1593811044950-7f45aac20843?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NDN8fGJhYnklMjBjbG90aGVzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1560506840-ec148e82a604?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NTJ8fGJhYnklMjBjbG90aGVzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1588103640889-ac5e68cf423f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTEyfHxiYWJ5JTIwY2xvdGhlc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1586475915213-69971ee3c21a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTQ0fHxiYWJ5JTIwY2xvdGhlc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1607111440702-d6f48537ac0e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTU4fHxiYWJ5JTIwY2xvdGhlc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1437683694336-3b49f6588141?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTY5fHxiYWJ5JTIwY2xvdGhlc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1611883916438-7a4b4aa5fc89?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTkxfHxiYWJ5JTIwY2xvdGhlc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"]
DETAILS = ["Great for baby's first outfit", "Great for early months, easy to maintain, very good quality materials", "Great quality, keep your baby stylish all the way", "A must have for any toddler", "Suitable for any season, just great overall", "Your small one will love this one for sure!", "Comfortable, organic cotton only, cute colour aswell :)"]
NAME = ["Dashing baby","Must have","Baby and Toddler","Organic Cotton", "Your baby's first swoosh", "Amazing offer!", "Best outfit for your small one", "Great quality onesie", "Cute level 9000 :)", "Summer vibes", "Spring vibes", "Your new favorite outfit"]
25.times do
    article = Article.new(
      name: NAME.sample,
      gender: Article::GENDER.sample,
      size: Article::SIZE.sample,
      price_per_month: [5, 10, 15, 20].sample,
      details: DETAILS.sample,
      user: User.first
    )

    file = URI.open(PHOTOS.sample)
    article.photos.attach(io: file, filename: 'baby.img', content_type: 'image/png')
    article.save
end

puts "Generating sample bookings..."
Article.all.each do |article|
  10.times do
    booking = Booking.new(
      message: Faker::GreekPhilosophers.quote,
      start_date: Date.today + rand(1..100).days,
      status: ["pending", "accepted", "declined"].sample,
      article: article,
      user: User.where.not(id: article.user.id).sample,
      number_of_weeks: [2, 4, 6, 8].sample
    )
    booking.save
  end
end

puts "You have now #{Article.count} articles and #{Booking.count} bookings!"
