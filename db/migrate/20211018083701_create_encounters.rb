class CreateEncounters < ActiveRecord::Migration[6.1]
  def change
    create_table :encounters do |t|

      t.timestamps
    end
  end
end
