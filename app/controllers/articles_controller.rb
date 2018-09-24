class ArticlesController < ApplicationController
  def index
    @articles = Article.approved_article.order_id(:desc)
                       .limit(Article::LIMIT_ARTICLES)
  end

  def new; end

  def load_more_data
    @article_last = params[:last_id].to_i
    @articles = Article.more_article(@article_last).order_id(:desc)
                       .limit(Article::LIMIT_ARTICLES)
  end

  def create
    @article = Article.new(user_id: params[:user_id], title: params[:title],
      content: params[:content], image: params[:image].to_s, status: 0)
    if @article.save
      flash[:success] = "Successfully created..."
      redirect_to request.referer
    else
      flash[:danger] = "Fail create..."
      redirect_to request.referer
    end
  end

  def show; end

  private
  def articles_params
    params.require(:article).permit Article::ARTICLES_PARAMS
  end
end
