class ArticlesController < ApplicationController
  before_action :find_article, only: %i(edit update destroy)

  def index
    @articles = Article.approved_article.order_id(:desc)
                       .limit(Article::LIMIT_ARTICLES)
  end

  def new
    @article = Article.new
  end

  def load_more_data
    @article_last = params[:last_id].to_i
    @articles = Article.more_article(@article_last).order_id(:desc)
                       .limit(Article::LIMIT_ARTICLES)
  end

  def create
    @article = Article.create(user_id: current_user.id,
      status: Article::APPROVED)
    @article.update_attributes(article_params)
    if @article.save
      flash[:success] = "Successfully created..."
      redirect_to admin_articles_path
    else
      flash[:danger] = "Fail create..."
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @article.update_attributes article_params
      flash[:success] = "Update successfull!"
    else
      flash[:danger] = "Fail"
    end
    redirect_back fallback_location: root_path
  end

  private
  def article_params
    params.require(:article).permit(:image, :title, :content, :public_time)
  end

  def find_article
    @article = Article.find_by id: params[:id]
    return if @article
    redirect_to root_path
  end
end
