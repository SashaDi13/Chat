class ApplicationController < ActionController::Base
  # protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :after_sign_in_path_for, if: :user_signed_in?


  def after_sign_in_path_for(*resource)
    authenticated_root_url(current_user) unless request.fullpath.include?("/#{current_user.slug}")
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
