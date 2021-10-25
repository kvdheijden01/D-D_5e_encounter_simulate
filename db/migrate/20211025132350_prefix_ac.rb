class PrefixAc < ActiveRecord::Migration[6.1]
  def change
    change_table :creaturetypes do |t|
      t.rename :AC, :ac
    end
  end
end
