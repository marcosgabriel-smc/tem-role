class Event < ApplicationRecord
  belongs_to :collective

  has_many :event_genres, dependent: :destroy
  has_many :genres, through: :event_genres

  has_many :event_lists

  validates :name, presence: true
  validates :start_time, comparison: { greater_than: DateTime.current }
  validates :end_time, comparison: { greater_than: :start_time }
  validates :state, inclusion: { in: STATES }

  ## GEOCODING
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address? ## NEED TO IMPLEMENT BETTER LOGIC
end
