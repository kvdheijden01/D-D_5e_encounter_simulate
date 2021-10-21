class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :HP
      t.integer :AC
      t.integer :proficiency
      t.integer :STR
      t.integer :DEX
      t.integer :CON
      t.integer :INT
      t.integer :WIS
      t.integer :CHA

      t.timestamps
    end
  end
end
