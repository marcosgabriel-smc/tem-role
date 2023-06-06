class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :collective, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :address
      t.string :city
      t.string :state
      t.string :ticket_link

      t.timestamps
    end
  end
end
