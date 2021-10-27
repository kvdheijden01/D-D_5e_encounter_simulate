class AttackDmgToFloat < ActiveRecord::Migration[6.1]
  def change
    change_table :attacks do |t|
      t.change :dmg, :float
    end

    change_table :attackplayers do |t|
      t.change :dmg, :float
    end
  end
end
