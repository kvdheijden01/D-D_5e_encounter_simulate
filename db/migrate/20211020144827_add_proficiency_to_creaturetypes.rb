class AddProficiencyToCreaturetypes < ActiveRecord::Migration[6.1]
  def change
    change_table :creaturetypes do |t|
      t.integer :proficiency
    end
  end
end
