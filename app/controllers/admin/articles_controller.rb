class Admin::ArticlesController < Admin::BaseController
  before_action :find_article, only: %i(edit update destroy show)

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all.page(params[:page]).per_page Settings.eight
  end

  def destroy
    @article.destroy
    flash[:sucess] = "Deleted"
    redirect_back fallback_location: root_path
  end

  def show
    @article.update_attributes watched: Article::WATCHED
  end

  def update_status
    @status = params[:current_status].to_i
    @article = Article.find_by id: params[:current_article].to_i
    @article.update_attributes status: (Article::APPROVED - @status)
  end

  def update_showed
    @counted = params[:counted].to_i
    @list_articles = Article.last(@counted)
    if @list_articles.count > 0
      @list_articles.each do |la|
        la.update_attributes(watched: Article::SHOWED)
      end
    end
  end

  def accept_article
    @article = Article.find_by id: params[:id].to_i
    
    @article.update_attributes(status: Article::APPROVED)
    redirect_back fallback_location: root_path
  end

  private
  def find_article
    @article = Article.find_by id: params[:id]
    return if @article
    redirect_to root_path
  end
end
