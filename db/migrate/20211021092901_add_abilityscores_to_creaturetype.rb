class AddAbilityscoresToCreaturetype < ActiveRecord::Migration[6.1]
  def change
    change_table :creaturetypes do |t|
      t.integer :STR
      t.integer :DEX
      t.integer :CON
      t.integer :INT
      t.integer :WIS
      t.integer :CHA
    end
  end
end
