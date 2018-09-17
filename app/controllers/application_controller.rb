class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :find_notification
  
  def find_notification
    @notifications = New.where.not(status: 1.to_i)
    # byebug
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer
      .permit(:sign_up){|u| u.permit User::USER_CREATE_PARAMS}
    devise_parameter_sanitizer
      .permit(:account_update){|u| u.permit User::USER_UPDATE_PARAMS}
  end
end
