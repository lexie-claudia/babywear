class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy, :edit, :update]

  def index
    if params[:query].present?
      @search_word = params[:query]
      @articles = Article.where(gender: params[:query])
    else
      @articles = Article.all
      @search_word = "All"
    end
  end

  def new
    @article = Article.new
  end

  def show
    @booking = Booking.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update(article_params)

    # no need for app/views/article/update.html.erb
    redirect_to article_path(@article)
  end

  def my_articles
    @article = Article.new
    @articles = Article.where(user: current_user)
  end

  def my_rentals
    @bookings = current_user.booking_requests.where(user_id: current_user)
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:name, :gender, :size, :price_per_month, :details, :photos)
  end
end
