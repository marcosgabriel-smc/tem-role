class Collective < ApplicationRecord
  ## Photos
  has_one_attached :banner
  has_one_attached :logo

  # relations
  ##################################################
  belongs_to :owner, class_name: "User", foreign_key: :owner_id

  has_many :memberships, dependent: :destroy
  has_many :accepted_memberships, -> { where(accepted: true) }, class_name: 'Membership'
  has_many :pending_memberships, -> { where(accepted: false) }, class_name: 'Membership'
  # the "members" are only the users who accepted the membership
  has_many :members, through: :accepted_memberships, source: :user

  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user

  has_many :collective_genres, dependent: :destroy
  has_many :genres, through: :collective_genres

  has_many :posts

  has_many :events, -> { order(start_time: :asc) }, dependent: :destroy

  # validations
  ##################################################
  validates :owner, presence: true
  validates(
    :name,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 3, maximum: 25 }
  )

  validates :state, inclusion: { in: STATES }

  # callbacks
  ##################################################
  after_create do
    Membership.create(collective: self, user: owner, accepted: true)
  end

  # customizations
  ##################################################
  def next_events
    events.where("start_time > ?", DateTime.current)
  end

  def previous_events
    events.where("start_time < ?", DateTime.current).reorder(start_time: :desc)
  end
end
