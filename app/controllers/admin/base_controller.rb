class Admin::BaseController < ApplicationController
  layout "admin/layouts/application"

  before_action :exam_user
  before_action :show_notification
  
  def show_notification
    @notifications = Article.notapproved_article.order_created(:desc)
    @counted = Article.count_noti
  end
  
  def exam_user
    redirect_to root_path if current_user.admin != true
  end
end
