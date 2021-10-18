require 'rails_helper'

RSpec.describe Enemy, type: :model do
  describe "validation" do
    it "enemy - creature model relations can retrieve name" do
      creature = create(:creature)
      enemy = create(:enemy)
      enemy.creatures.push(creature)
      expect(enemy.creatures.first.name).to eq(creature.name)
    end

    it "enemy -creatures model relations can store and retrieve data from multiple creatures" do
      goblin = create(:creature, name: "Goblin")
      imp = create(:creature, name: "Imp")
      enemy = create(:enemy)
      enemy.creatures.push(goblin)
      enemy.creatures.push(imp)
      expect(enemy.creatures[0].name).to eq(goblin.name)
      expect(enemy.creatures[1].name).to eq(imp.name)
      
    end

  end

end
