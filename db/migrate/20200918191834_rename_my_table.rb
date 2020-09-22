class RenameMyTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :partners, :partnerships
  end
end
