class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # redirect to dashboard index after
  # devise sign in
  def after_sign_in_path_for(resource)
    user_user_homes_path(resource)
  end

  # redirect to session new after
  # devise sign out

end
