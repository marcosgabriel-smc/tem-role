class CollectiveGenre < ApplicationRecord
  belongs_to :collective
  belongs_to :genre
end
