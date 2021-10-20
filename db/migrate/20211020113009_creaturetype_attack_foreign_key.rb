class CreaturetypeAttackForeignKey < ActiveRecord::Migration[6.1]
  def change
    change_table :attacks do |t|
      t.references :creaturetype, null:true, foreign_key:true
    end
  end
end
