class CreateCreatures < ActiveRecord::Migration[6.1]
  def change
    create_table :creatures do |t|
      t.string :name
      
      t.references :enemy, null:true, foreign_key:true
      t.timestamps
    end
  end
end
