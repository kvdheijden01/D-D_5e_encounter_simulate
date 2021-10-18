class CreateEnemies < ActiveRecord::Migration[6.1]
  def change
    create_table :enemies do |t|
      t.float :HPpool
      t.float :DmgPerRound

      t.timestamps
    end
  end
end
