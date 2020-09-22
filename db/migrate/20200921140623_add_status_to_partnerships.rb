class AddStatusToPartnerships < ActiveRecord::Migration[6.0]
  def change
    add_column :partnerships, :status, :string, default: 'pending'
  end
end
