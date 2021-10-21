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

    it "model relations can retrieve player name" do
      player = create(:player)
    
      party = create(:party)
      encounter = create(:encounter)
      party.players.push(player)
      encounter.party = party
      
      expect(encounter.party.players.first.name).to eq(player.name)
    end

  end
end
