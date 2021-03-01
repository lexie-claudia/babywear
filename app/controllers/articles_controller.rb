class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy]
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

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:name, :gender, :size, :price_per_month, :details)
  end
end