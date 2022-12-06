class Room < ApplicationRecord
  # CHAT = 'chat'.freeze
  # CHAT_GROUP = 'chat_group'.freeze
  # CHANNEL = 'channel'.freeze
  #
  # STATUS = [CHAT, CHAT_GROUP, CHANNEL]
  mount_uploader :avatar, AvatarUploader
  extend FriendlyId
  friendly_id :slug_name, use: :slugged

  belongs_to :user, required: false

  validates :name, presence: true, uniqueness: true
end
