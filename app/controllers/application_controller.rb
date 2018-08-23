class ApplicationController < ActionController::Base

  def auth_user
    if current_user.nil?
      session[:previous_url] = request.fullpath
      authenticate_user!
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || books_path
  end

end
