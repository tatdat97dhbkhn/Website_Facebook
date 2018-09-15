class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer
      .permit(:sign_up){|u| u.permit User::USER_CREATE_PARAMS}
    devise_parameter_sanitizer
      .permit(:account_update){|u| u.permit User::USER_UPDATE_PARAMS}
  end

  def login_user
    if user_signed_in?
      redirect_to root_path
    else
      redirect_to new_user_session_path
    end
  end
end
