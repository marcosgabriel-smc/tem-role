class AddCompleteAddressToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :zipcode, :string
    add_column :events, :street, :string
    add_column :events, :neighborhood, :string
    add_column :events, :street_number, :integer
  end
end
