class CreateEventGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :event_genres do |t|
      t.references :genre, null: false, foreign_key: true
      t.references :collective, null: false, foreign_key: true

      t.timestamps
    end
  end
end
