class EventListSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :event_list
end
