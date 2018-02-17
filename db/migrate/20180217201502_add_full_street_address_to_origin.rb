class AddFullStreetAddressToOrigin < ActiveRecord::Migration[5.1]
  def change
    add_column :origins, :full_street_address, :string
  end
end
