class CreateCollectiveGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :collective_genres do |t|
      t.references :collective, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
