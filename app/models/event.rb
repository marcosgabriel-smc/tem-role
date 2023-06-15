class Event < ApplicationRecord
  belongs_to :collective

  has_many :event_genres, dependent: :destroy
  has_many :genres, through: :event_genres

  has_many :event_lists

  # validations
  #############################
  validates :name, presence: true
  validates :start_time, comparison: { greater_than: DateTime.current }
  validates :end_time, comparison: { greater_than: :start_time }
  validates :state, inclusion: { in: STATES }

  ## GEOCODING
  geocoded_by :address
  before_save :geocode, if: :will_save_change_to_address? ## NEED TO IMPLEMENT BETTER LOGIC

  # callbacks
  ##################################################
  after_create do
    EventList.create(event: self, name: "Lista Tem Role?", requirement: "")
  end

  # customizations
  ##################################################

  # always sort by start_time
  default_scope { order(start_time: :asc) }

  # next events
  def self.next
    where('start_time > ?', DateTime.current)
  end

  # previous
  def self.previous
    where('start_time < ?', DateTime.current)
  end
end
