class ApplicationController < ActionController::Base
  # protect_from_forgery
  before_action :after_sign_in_path_for, if: :user_signed_in?


  def after_sign_in_path_for(*resource)
    authenticated_root_url(current_user) unless request.fullpath.include?("/#{current_user.slug}")
  end
end
