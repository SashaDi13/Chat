class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  extend FriendlyId
  friendly_id :username, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true

  scope :all_except, ->(user) { where.not(id: user) }

  has_many :messages
  has_many :participants
  has_many :rooms, through: :participants

  enum status: %i[:offline :away :online]

  after_initialize do |_config|
    User.update_all(status: User.statuses[":offline"])
  end

  def status_to_css
    case status
    when ":online"
      'online'
    when ":away"
      'away'
    when ":offline"
      'offline'
    end
  end
end
