class PagesController < ApplicationController
  def add_new_comment
    content = params[:comment]
    article_id = params[:article_id]

    @comment = Comment.create(user_id: current_user.id,
      article_id: article_id, content: content)

    @article = find_article article_id
    find_info_article @article
  end

  def like_status
    @delete_like = Like.like_destroy(current_user.id,
      params[:article_id], params[:number_one]).first
    @delete_like&.destroy

    @like = Like.create(user_id: current_user.id,
      article_id: params[:article_id], status: params[:number_tow])

    @article = find_article @like.article_id
    find_info_article @article
  end

  def revoke_status
    @like = Like.like_destroy(current_user.id,
      params[:article_id], params[:number]).first
    @like&.destroy

    @article = find_article params[:article_id]
    find_info_article @article
  end

  def list_article_care
    @list_followings = Follow.list_followings(current_user.id)
    @list_user_care = []
    @list_followings.each do |lf|
      @list_user_care.push User.find_by id: lf.following_id
    end
  end

  def find_info_article article
    @count_likes = article.likes.list_likes.count
    @count_unlikes = article.likes.list_unlike.count
    @count_comments = article.comments.count
    @total = @count_likes - @count_unlikes
    article.update_attributes count_likes: @total
  end

  def find_article article_id
    Article.find_by id: article_id
  end
end
