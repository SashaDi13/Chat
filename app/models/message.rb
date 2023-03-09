class Message < ApplicationRecord
  mount_uploader :image, ImageUploader
  # STATUS = [READED, SENDED, UNREADED, UNSENDED]
  belongs_to :user
  belongs_to :room

  before_create :confirm_participant

  def confirm_participant
    return unless room.private?

    is_participant = Participant.where(user_id: user.id, room_id: room.id).first
    throw :abort unless is_participant
  end
end
