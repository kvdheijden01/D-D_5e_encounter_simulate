class AddAcToCreaturetype < ActiveRecord::Migration[6.1]
  def change
    change_table :creaturetypes do |t|
      t.integer :AC
    end
  end
end
