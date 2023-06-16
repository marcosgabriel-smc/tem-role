class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # relations
  ##################################################
  has_many :collectives, foreign_key: :owner_id, class_name: "Collective"

  has_many :event_list_subscriptions, dependent: :destroy
  has_many :event_lists, through: :event_list_subscriptions
  has_many :subscribed_events, -> { where('end_time > ?', DateTime.current) }, through: :event_lists, source: :event

  has_many :memberships, dependent: :destroy
  has_many :accepted_invites, -> { where(accepted: true) }, class_name: 'Membership'
  has_many :pending_invites, -> { where(accepted: false) }, class_name: 'Membership'
  has_many :collective_memberships, through: :accepted_invites, source: :collective

  # validations
  ##################################################
  validates :username, presence: true

  # callbacks
  ##################################################
  before_validation { self.username = email.gsub(/@.*/, '') if username.nil? }

  # customizations
  ##################################################
  def soundcloud_url
    soundcloud || "https://soundcloud.com/discover"
  end

  def instagram_url
    instagram || "https://www.instagram.com/"
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
