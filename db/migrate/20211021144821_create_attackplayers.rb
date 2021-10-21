class CreateAttackplayers < ActiveRecord::Migration[6.1]
  def change
    create_table :attackplayers do |t|
      t.string :name
      t.string :ability_mod
      t.string :dmg

      t.timestamps
    end
  end
end
