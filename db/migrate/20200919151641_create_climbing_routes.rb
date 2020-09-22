class CreateClimbingRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :climbing_routes do |t|
      t.string :name
      t.string :style, array: true
      t.string :difficulty
      t.string :pitches
      t.string :location, array: true
      t.string :url
      t.timestamps
    end
  end
end
