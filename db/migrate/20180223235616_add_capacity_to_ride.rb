class AddCapacityToRide < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :capacity, :integer, :default => 3
  end
end
