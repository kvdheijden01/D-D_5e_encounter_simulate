class CreateAttacks < ActiveRecord::Migration[6.1]
  def change
    create_table :attacks do |t|
      t.string :name
      t.string :ability_mod
      t.integer :dmg

      t.timestamps
    end
  end
end
