class CreateAttackplayers < ActiveRecord::Migration[6.1]
  def change
    create_table :attackplayers do |t|
      t.string :name
      t.string :ability_mod
      t.integer :dmg

      t.references :player, null:true, foreign_key:true
      t.timestamps
    end
  end
end
