class Admin::BaseController < ApplicationController
  layout "admin/layouts/application"

  before_action :exam_user

  def exam_user
    redirect_to root_path if current_user.admin != true
  end
end
