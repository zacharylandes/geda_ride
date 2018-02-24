class AddPassengerCountToRide < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :passenger_count, :integer
  end
end
