class BookingsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @bookings = Booking.All
  end
end
