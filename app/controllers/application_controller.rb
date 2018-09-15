class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :new_article
  before_action :all_feedbacks

  def all_feedbacks
    if current_user && current_user.admin != true
      @list_feedback = Article.find_news_feed(current_user.id).order_created(:desc)
      @count_feedback = Article.count_user_noti(current_user.id)
    end
  end

  def new_article
    @article = Article.new
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer
      .permit(:sign_up){|u| u.permit User::USER_CREATE_PARAMS}
    devise_parameter_sanitizer
      .permit(:account_update){|u| u.permit User::USER_UPDATE_PARAMS}
  end
end
