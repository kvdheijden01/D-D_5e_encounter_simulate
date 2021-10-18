class CreateEnemies < ActiveRecord::Migration[6.1]
  def change
    create_table :enemies do |t|
      t.float :HPpool
      t.float :DmgPerRound

      t.references :encounter, null:true, foreign_key:true
      t.timestamps
    end
  end
end
