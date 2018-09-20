class Admin::BaseController < ApplicationController
  layout "admin/layouts/application"
  # before_action :find_notification

  # def find_notification
  #   @notifications = New.where.not(status: 1.to_i)
  #   # byebug
  # end
end
