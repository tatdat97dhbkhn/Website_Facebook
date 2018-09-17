class NewsController < ApplicationController
  def new
  end

  def create
    @new = New.new(user_id: params[:user_id], title: params[:title],
      content: params[:content], image: params[:image].to_s, status: 0)
    if @new.save
      flash[:success] = "Successfully created..."
      redirect_to request.referer
    else
      flash[:danger] = "Fail create..."
      redirect_to request.referer
    end
  end

  def show
  end

  private
  def news_params
    params.require(:new).permit New::NEWS_PARAMS
  end
end
