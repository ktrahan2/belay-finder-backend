class ChangeStatusPartnershipsTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :partnerships, :status, :partnership_status
  end
end
