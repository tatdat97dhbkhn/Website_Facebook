class UsersController < ApplicationController
  def show
    @articles = Article.find_news(params[:id]).order_created(:desc)
    @favorites = Like.find_likes(params[:id])
                     .order(created_at: :desc)
    @user = User.find_by id: params[:id]
  end

  def search_user
    @name_search = params[:name_search]
    @users = User.find_user(@name_search)
  end
end
