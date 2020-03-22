class ArticlesController < ApplicationController
  def index
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)

    if @article.persisted?
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
