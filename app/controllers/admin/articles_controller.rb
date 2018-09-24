class Admin::ArticlesController < Admin::BaseController
  before_action :find_article, only: %i(edit update destroy)

  def index
    @articles = Article.all.page(params[:page]).per_page 10
  end

  def new
    @article = Article.new
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

  def destroy
    @article.destroy
    flash[:sucess] = "Deleted"
    redirect_back fallback_location: root_path
  end

  def show; end

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
