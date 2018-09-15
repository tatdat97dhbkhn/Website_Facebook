class PagesController < ApplicationController
  def index
    @articles = Article.where(status: 1).order(:created_at).page(params[:page])
  end

  def add_new_comment
    content = params[:comment]
    user_id = params[:user_id]
    article_id = params[:article_id]
    @comment = Comment.new(user_id: user_id,
      article_id: article_id, content: content)
    @comment.save
    @article = Article.find_by id: article_id
  end

  def like_status
    @delete_like = Like.where(user_id: params[:user_id],
      article_id: params[:article_id], status: params[:number_one]).first
    @delete_like&.destroy
    @like = Like.new(user_id: params[:user_id],
      article_id: params[:article_id], status: params[:number_tow])
    @like.save
    @article = Article.find_by id: @like.article_id
    @count_likes = @article.likes.where(status: Article::APPROVED).count
    @count_unlikes = @article.likes.where(status: Article::NOT_APPROVED).count
    @count_comments = @article.comments.count
  end

  def revoke_status
    @like = Like.where(user_id: params[:user_id],
      article_id: params[:article_id], status: params[:number]).first
    @like&.destroy
    @article = Article.find_by id: params[:article_id]
    @count_likes = @article.likes.where(status: Article::APPROVED).count
    @count_unlikes = @article.likes.where(status: Article::NOT_APPROVED).count
    @count_comments = @article.comments.count
  end
end
