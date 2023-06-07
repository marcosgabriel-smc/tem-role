class Event < ApplicationRecord
  belongs_to :collective

  has_many :event_genres
  has_many :genres, through: :event_genres

  has_many :event_lists

  validates :name, presence: true
  validates :start_time, comparison: { greater_than: DateTime.current }
  validates :end_time, comparison: { greater_than: :start_time }
end
