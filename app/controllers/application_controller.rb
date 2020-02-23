class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    users_home_path # ログイン後に遷移するpath
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpath
  end

end
