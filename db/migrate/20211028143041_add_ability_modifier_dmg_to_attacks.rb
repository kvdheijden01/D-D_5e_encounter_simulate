class AddAbilityModifierDmgToAttacks < ActiveRecord::Migration[6.1]
  def change
    change_table :attacks do |t|
      t.boolean :ability_modifier_dmg
    end

    change_table :attackplayers do |t|
      t.boolean :ability_modifier_dmg
    end
  end
end
