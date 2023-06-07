class Collective < ApplicationRecord
  # relations
  ##################################################
  belongs_to :owner, class_name: "User", foreign_key: :owner_id

  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user

  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user

  has_many :collective_genres, dependent: :destroy
  has_many :genres, through: :collective_genres

  has_many :posts

  has_many :events, dependent: :destroy

  # validations
  ##################################################
  validates :owner, presence: true
  validates(
    :name,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 3 }
  )

  # callbacks
  ##################################################
  after_create do
    Membership.create(collective: self, user: owner)
  end
end
