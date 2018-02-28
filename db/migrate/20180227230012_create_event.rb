class CreateEvent < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.string :url
      t.string :image
      t.float :longitude
      t.float :latitude
    end
  end
end
