class AddStatusToUsersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :belay_status, :string, default: "unavailable"
  end
end
