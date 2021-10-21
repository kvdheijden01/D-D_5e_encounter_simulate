class AddForeignKeyPlayersToParty < ActiveRecord::Migration[6.1]
  def change
    change_table :players do |t|
      t.references :party, null:true, foreign_key:true
    end
  end
end
