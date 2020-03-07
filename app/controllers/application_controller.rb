class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    users_home_path # ログイン後に遷移するpath
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpath
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
