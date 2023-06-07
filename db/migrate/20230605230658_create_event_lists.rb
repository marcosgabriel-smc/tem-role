class CreateEventLists < ActiveRecord::Migration[7.0]
  def change
    create_table :event_lists do |t|
      t.references :event, null: false, foreign_key: true
      t.string :name
      t.text :requirement

      t.timestamps
    end
  end
end
