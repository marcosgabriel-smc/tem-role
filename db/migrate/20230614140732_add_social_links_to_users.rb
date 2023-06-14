class AddSocialLinksToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :soundcloud, :string
    add_column :users, :instagram, :string
  end
end
