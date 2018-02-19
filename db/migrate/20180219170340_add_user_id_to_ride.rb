class AddUserIdToRide < ActiveRecord::Migration[5.1]
  def change
    add_reference :rides, :user, foreign_key: true
  end
end
