class AddFullStreetAddressToDestination < ActiveRecord::Migration[5.1]
  def change
    add_column :destinations, :full_street_address, :string

  end
end
