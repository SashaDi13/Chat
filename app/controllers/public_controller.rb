class PublicController < ApplicationController
  # skip_before_action :authenticate_user!
  after_action :set_status
  def index
    redirect_to new_user_session_path
  end

  private

  def set_status
    current_user.update!(status: User.statuses[:offline]) if current_user
  end
end
