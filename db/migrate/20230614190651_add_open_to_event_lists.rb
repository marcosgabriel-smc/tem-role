class AddOpenToEventLists < ActiveRecord::Migration[7.0]
  def change
    add_column :event_lists, :open, :boolean, default: true
  end
end
