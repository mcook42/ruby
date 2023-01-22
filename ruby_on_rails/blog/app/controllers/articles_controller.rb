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
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def article_params
    # Strong parameters (parameterized-query-like) are preferred for brevity and safety. https://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
    params.require(:article).permit(:title, :body)
  end
end
