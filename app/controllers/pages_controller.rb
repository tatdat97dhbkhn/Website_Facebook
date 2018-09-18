class PagesController < ApplicationController
  def index
    @news = New.where(status: 1)
  end
  
  def add_new_comment
    content = params[:comment]
    user_id = params[:user_id]
    new_id = params[:new_id]
    @comment = Comment.new(user_id: user_id, new_id: new_id, content: content)
    @comment.save
  end

  def like_status
    @delete_like = Like.where(user_id: params[:user_id], new_id: params[:new_id], status: params[:number_one]).first
    if @delete_like
      @delete_like.destroy
    end
    @like = Like.new(user_id: params[:user_id], new_id: params[:new_id], status: params[:number_tow])
    @like.save
    @new = New.find_by id: @like.new_id
  end

  def revoke_status
    @like = Like.where(user_id: params[:user_id], new_id: params[:new_id], status: params[:number]).first
    if @like
      @like.destroy
    end
    @new = New.find_by id: params[:new_id]
  end
end
