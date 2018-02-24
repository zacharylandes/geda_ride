class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.references :ride, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :passenger_count
    end
  end
end
