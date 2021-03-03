class BookingsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @bookings = Booking.All
  end

  def my_bookings
    @bookings = Booking.all
  end
end
