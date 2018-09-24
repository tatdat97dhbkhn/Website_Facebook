class UsersController < ApplicationController
  def show
    @articles = Article.find_news(params[:id]).order_created(:desc)
    @favorites = Like.find_likes(params[:id])
                     .order(created_at: :desc)
    @user = User.find_by id: params[:id]
    @flag = exam_followed? @user
    @list_followings = Follow.list_followings(@user.id)
    @list_followers = Follow.list_followers(@user.id)
  end

  def search_user
    @name_search = params[:name_search]
    @users = User.find_user(@name_search)
  end

  def exam_followed? user
    Follow.where(user_id: current_user.id, following_id: user.id).first
  end
end
