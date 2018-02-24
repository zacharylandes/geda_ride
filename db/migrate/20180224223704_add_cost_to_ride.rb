class AddCostToRide < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :cost, :float
  end
end
