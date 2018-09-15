class ArticlesController < ApplicationController
  before_action :find_article, only: %i(edit update destroy)

  def add_arr_count sort_times
    @arr_sort = []
    sort_times.each do |t|
      @arr_sort.push [Like.count_likes(t.id).count - Like.count_unlikes(t.id).count, t.id]
    end
  end

  def sort_like arr_sort
    temp = arr_sort[0]
    for i in 0...arr_sort.count - 1
      j= i+1
      for j in 0...arr_sort.count
        if arr_sort[i][0] > arr_sort[j][0]
          temp = arr_sort[j]
          arr_sort[j] = arr_sort[i]
          arr_sort[i] = temp
        end
      end
    end
  end

  def result_sort arr_sort
    @articles = []
    arr_sort.each do |arl|
      @articles.push Article.find_by id: arl[1]
    end
  end

  def index
    @sort_time = Article.all.order_public_time(Time.zone.now).
      sort_time(:desc).sort_likes(:desc)
    @articles = @sort_time.page(params[:page]).per_page Article::LIMIT_ARTICLES
    @count_article = Article.find_news(current_user.id).count
    @count_follower = Follow.list_followers(current_user.id).count

    respond_to do |format|
      format.html
      format.js
    end
  end

  def load_more_data
    @article_last = params[:last_id].to_i
    @articles = Article.more_article(@article_last).order_id(:desc)
                       .limit(Article::LIMIT_ARTICLES)
  end

  def create
    if current_user.admin == true
      @article = Article.create(user_id: current_user.id,
        status: Article::APPROVED)
    else
      @article = Article.create(user_id: current_user.id,
        status: Article::NOT_APPROVED)
    end

    @article.update_attributes(article_params)

    if @article.save
      flash[:success] = "Please wait admin review article!!!"
    else
      flash[:danger] = "Fail create..."
    end
    redirect_back fallback_location: root_path
  end

  def user_update_showed
    @list_articles_user = Article.find_news_feed(current_user.id)
    if @list_articles_user.count > 0
      @list_articles_user.each do |la|
        la.update_attributes(user_watched: Article::USER_SHOWED)
      end
    end
  end

  def user_update_watched
    @id = params[:ar_id].to_i
    @article = Article.find_by id: @id
    @article.update_attributes user_watched: Article::USER_WATCHED
  end

  def show
  end

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
