class Genre < ApplicationRecord
  has_many :collective_genres
  has_many :collectives, through: :collective_genres

  has_many :event_genres
  has_many :events, through: :event_genres
end
