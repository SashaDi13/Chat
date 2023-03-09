class Room < ApplicationRecord
  # CHAT = 'chat'.freeze
  # CHAT_GROUP = 'chat_group'.freeze
  # CHANNEL = 'channel'.freeze
  #
  # STATUS = [CHAT, CHAT_GROUP, CHANNEL]
  mount_uploader :avatar, AvatarUploader
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user, required: false
  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :public_rooms, -> { where(private: false) }
  scope :private_rooms, -> { where(private: true) }
  scope :ordered, -> { includes(:messages).order('messages.created_at DESC') }
  scope :user_room, -> (user) { joins(:participants).where(participants: { user_id: user.id }) }
  scope :current_rooms, -> (user) { self.user_room(user).and(self.public_rooms).ordered }

  def self.create_private_room(users, room_name, slug_name)
    single_room = Room.create(name: room_name, slug_name: slug_name, private: true)
    users.each do |user|
      Participant.create(user_id: user.id, room_id: single_room.id )
    end
    single_room
  end
end
