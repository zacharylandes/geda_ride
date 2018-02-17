class CreateRides < ActiveRecord::Migration[5.1]
  def change
    create_table :rides do |t|
      t.string :timestamps

      t.timestamps
    end
  end
end
