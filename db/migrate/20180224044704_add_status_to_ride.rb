class AddStatusToRide < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :status, :integer, :default => 3
  end
end
