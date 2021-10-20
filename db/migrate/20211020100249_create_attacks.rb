class CreateAttacks < ActiveRecord::Migration[6.1]
  def change
    create_table :attacks do |t|
      t.string :ability_mod
      t.string :dmg

      t.timestamps
    end
  end
end
