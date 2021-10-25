class LowerCaseAc < ActiveRecord::Migration[6.1]
  def change
    t.rename :AC, :ac
  end
end
