class Admin::ArticlesController < Admin::BaseController
  before_action :find_article, only: %i(edit update destroy)

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all.page(params[:page]).per_page 8
  end

  def destroy
    @article.destroy
    flash[:sucess] = "Deleted"
    redirect_back fallback_location: root_path
  end

  def show; end

  def update_status
    @status = params[:current_status].to_i
    @article = Article.find_by id: params[:current_article].to_i
    @article.update_attributes status: (Article::APPROVED - @status)
  end

  private
  def find_article
    @article = Article.find_by id: params[:id]
    return if @article
    redirect_to root_path
  end
end
