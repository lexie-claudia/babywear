class BookingsController < ApplicationController
  before_action :set_article_id, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.article = @article
    @booking.user = current_user
    if @booking.save
      redirect_to my_bookings_path
    else
      render :new
    end
  end

  def my_bookings
    @bookings = Booking.all
  end


  def edit
  end

  def deny
    @booking = Booking.find(params[:id])
    if @booking.article.user == current_user && @booking.update(status: 'declined')
      flash[:notice] = "The booking has been declined"
    else
      flash[:alert] = "An error has occured."
    end
    redirect_to my_rentals_path
  end

  def accept
    @booking = Booking.find(params[:id])
    if @booking.article.user == current_user && @booking.update(status: 'accepted')
      flash[:notice] = "The booking has been accepted"
    else
      flash[:alert] = "An error has occured."
    end
    redirect_to my_rentals_path
  end

  private

  def set_article_id
    @article = Article.find(params[:article_id])
  end


  def booking_params
    params.require(:booking).permit(:start_date, :message, :number_of_weeks, :price, :status)
  end

end
