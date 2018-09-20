class  Admin::NewsController < Admin::BaseController
  def index
    @news = New.all.page(params[:page]).per_page 10
  end

  def new
    @user = current_user
  end

  def create
    @new = New.new(new_params)
    if @new.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def new_params
    params.require(:new).permit New::NEWS_PARAMS
  end
end
