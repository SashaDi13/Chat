class Account::AccountController < ApplicationController
  layout 'account'

  before_action :authenticate_user!
  after_action :set_status

  def rooms
    (Room.public_rooms + current_user.rooms.private_rooms).sort_by {|room| room.messages.last.created_at if room.messages.any?}.reverse!
  end

  private

  def set_status
    current_user.update!(status: User.statuses[:offline]) if current_user
  end
end
