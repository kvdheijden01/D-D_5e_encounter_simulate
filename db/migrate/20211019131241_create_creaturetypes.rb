class CreateCreaturetypes < ActiveRecord::Migration[6.1]
  def change
    create_table :creaturetypes do |t|
      t.string :name

      t.timestamps
    end

    change_table :creatures do |t|
      t.remove :name
      t.references :creaturetypes, null:false, foreign_key:true
    end
  end
end
