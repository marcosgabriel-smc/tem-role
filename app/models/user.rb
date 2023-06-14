class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :collectives, foreign_key: :owner_id, class_name: "Collective"
  has_many :subscriptions

  has_many :memberships, dependent: :destroy
  has_many :accepted_invites, -> { where(accepted: true) }, class_name: 'Membership'
  has_many :pending_invites, -> { where(accepted: false) }, class_name: 'Membership'
  has_many :collective_memberships, through: :accepted_invites, source: :collective

  validates :name, presence: true

  before_validation { self.name = email.gsub(/@.*/, '') if name.nil? }

  def soundcloud_url
    soundcloud || "https://soundcloud.com/discover"
  end

  def instagram_url
    instagram || "https://www.instagram.com/"
  end
end
