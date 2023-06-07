class AddNameAndAvatarToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false, unique: true
    add_column :users, :avatar, :string
  end
end
