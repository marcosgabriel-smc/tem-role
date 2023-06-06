class CreateEventListSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :event_list_subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
