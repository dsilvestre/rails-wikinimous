class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index         # GET /articles
    @articles = Article.all
  end

  def show          # GET /articles/:id
    # params[:id]
  end

  # Display the form
  def new           # GET /articles/new
    @article = Article.new
  end

  # Process the form
  def create        # POST /articles
    @article = Article.new(article_params)
    @article.save

    redirect_to article_path(@article)
  end

  def edit          # GET /articles/:id/edit
  end

  def update        # PATCH /articles/:id
    @article.update(article_params)
    @article.save

    redirect_to article_path(@article)
  end

  def destroy       # DELETE /articles/:id
    @article.destroy

    redirect_to articles_path
  end

  private

  # Strong params for security reasons
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end

