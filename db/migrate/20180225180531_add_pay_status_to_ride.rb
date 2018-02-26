class AddPayStatusToRide < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :pay_status, :boolean, :deafult => false
  end
end
