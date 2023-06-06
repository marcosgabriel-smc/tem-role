class EventGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :collective
end
