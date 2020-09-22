class AddClimbingStyleToUsersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :climbing_style, :string, array: true
  end
end
