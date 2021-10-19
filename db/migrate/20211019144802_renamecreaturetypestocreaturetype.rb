class Renamecreaturetypestocreaturetype < ActiveRecord::Migration[6.1]
  def change
    change_table :creatures do |t|
      t.rename :creaturetypes_id, :creaturetype_id
    end
  end
end
