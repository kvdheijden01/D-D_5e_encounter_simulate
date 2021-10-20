class AddHpToCreaturetype < ActiveRecord::Migration[6.1]
  def change
    change_table :creaturetypes do |t|
      t.integer :HP
    end
  end
end
