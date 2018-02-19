class AddDateToRide < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :date, :date
  end
end
