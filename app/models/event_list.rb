class EventList < ApplicationRecord
  belongs_to :event

  has_many :event_list_subscriptions
  has_many :users, through: :event_list_subscriptions
end
