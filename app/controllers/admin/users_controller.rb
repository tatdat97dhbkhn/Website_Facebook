class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def show
  end

  def destroy
    @user = User.find_by id: params[:id]
    if @user.delete
      flash[:success] = "Delete successfull!"
      redirect_back fallback_location: root_path
    else
      flash[:success] = "Delete fail!"
      redirect_back fallback_location: root_path
    end
  end
end
