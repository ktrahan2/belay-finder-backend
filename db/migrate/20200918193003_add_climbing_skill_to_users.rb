class AddClimbingSkillToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :climbing_skill, :string
  end
end
