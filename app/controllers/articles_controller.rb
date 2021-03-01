class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @articles = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    # no need for app/views/article/update.html.erb
    redirect_to article_path(@article)
  end

  private

  def article_params
    params.require(:article).permit(:name, :gender, :size, :price_per_month, :details)
  end
end
