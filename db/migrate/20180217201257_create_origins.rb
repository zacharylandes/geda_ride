class CreateOrigins < ActiveRecord::Migration[5.1]
  def change
    create_table :origins do |t|
      t.references :ride, foreign_key: true
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
