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


   # callbacks
  ##################################################
  after_create do
    EventList.create(event: self, name: "Lista Tem Role?", requirement: "")
  end
end
