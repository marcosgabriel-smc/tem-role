class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.references :collective, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :dj, default: false

      t.timestamps
    end
  end
end
