class CreateFavoriteRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_routes do |t|
      t.references :user
      t.references :climbing_route
      t.timestamps
    end
  end
end
