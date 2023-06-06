class Collective < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :owner_id

  has_many :memberships
  has_many :members, through: :memberships, source: :user

  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user

  has_many :collective_genres
  has_many :genres, through: :collective_genres

  has_many :posts

  has_many :events

  # validations
  ##################################################
  validates :name, presence: true, uniqueness: true
end
