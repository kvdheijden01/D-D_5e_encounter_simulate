require 'rails_helper'

RSpec.describe Encounter, type: :model do
  describe "validation" do
    it "model relations can retrieve creature name" do
      creaturetype = create(:creaturetype)
      creature = create(:creature, creaturetype: creaturetype)
    
      enemy = create(:enemy)
      encounter = create(:encounter)
      enemy.creatures.push(creature)
      encounter.enemy = enemy
      
      expect(encounter.enemy.creatures.first.creaturetype.name).to eq(creaturetype.name)
    end

  end
end
