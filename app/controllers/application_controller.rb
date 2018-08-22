class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    session[:previous_url] || books_path
  end

end
