class AddThingsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :aboutme, :text
  end
end
