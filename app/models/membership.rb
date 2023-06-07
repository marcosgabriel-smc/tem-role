class Membership < ApplicationRecord
  belongs_to :collective
  belongs_to :user

  validates :user, uniqueness: {
    scope: :collective,
    message: "already a member of the given collective"
  }
end
