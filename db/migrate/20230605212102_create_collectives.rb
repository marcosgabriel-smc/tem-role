class CreateCollectives < ActiveRecord::Migration[7.0]
  def change
    create_table :collectives do |t|
      t.string :name, null: false, unique: true
      t.text :description
      t.string :logo
      t.string :city
      t.string :state
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
