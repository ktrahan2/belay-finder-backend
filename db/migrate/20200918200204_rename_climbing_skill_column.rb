class RenameClimbingSkillColumn < ActiveRecord::Migration[6.0]
  change_table :users do |t|
    t.change :climbing_skill, :string
  end
end
