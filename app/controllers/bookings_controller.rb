class BookingsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @booking = Booking.new
  end

  def create
    @article = Article.find(params[:article_id])
    @booking = Booking.new(booking_params)
    @booking.article = @article
    @booking.user = current_user
    if @booking.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :message, :number_of_weeks, :price, :status)
  end
end
