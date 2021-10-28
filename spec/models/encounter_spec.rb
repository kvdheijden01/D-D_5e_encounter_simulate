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

  describe "calculations" do
    it "tests if acc_mod is calcualted" do
      enemy = create(:enemy)
      creaturetype = create(:creaturetype, DEX: 16, AC: 15)
      creaturetype.attacks.push(create(:attack, ability_mod: "DEX"))
      enemy.creatures.push(create(:creature, creaturetype: creaturetype))
      creaturetype = create(:creaturetype, name: "Imp")
      creaturetype.attacks.push(create(:attack))
      enemy.creatures.push(create(:creature, creaturetype: creaturetype))

      party = create(:party)
      fighter = create(:player, name: "Fighter", DEX: 16, AC: 15)
      fighter.attackplayers.push(create(:attackplayer, ability_mod: "DEX"))
      wizard = create(:player, name: "Wizard")
      wizard.attackplayers.push(create(:attackplayer))
      party.players.push(fighter)
      party.players.push(wizard)

      encounter = create(:encounter)
      encounter.party = party
      encounter.enemy = enemy

      expect(encounter.cal_acc_mod_enemy).to eq(0.575)
      expect(encounter.cal_acc_mod_party).to eq(0.575)
    end

    it "tests if damage per round is calcualted" do
      enemy = create(:enemy)
      creaturetype = create(:creaturetype, DEX: 16, AC: 15)
      creaturetype.attacks.push(create(:attack, ability_mod: "DEX", dmg: 4.5))
      enemy.creatures.push(create(:creature, creaturetype: creaturetype))
      creaturetype = create(:creaturetype, name: "Imp")
      creaturetype.attacks.push(create(:attack))
      enemy.creatures.push(create(:creature, creaturetype: creaturetype))

      party = create(:party)
      fighter = create(:player, name: "Fighter", DEX: 16, AC: 15)
      fighter.attackplayers.push(create(:attackplayer, ability_mod: "DEX", dmg: 4.5))
      wizard = create(:player, name: "Wizard")
      wizard.attackplayers.push(create(:attackplayer))
      party.players.push(fighter)
      party.players.push(wizard)

      encounter = create(:encounter)
      encounter.party = party
      encounter.enemy = enemy
      encounter.cal_dmg_per_round

      
      expect(encounter.enemy.DmgPerRound).to eq(2.875)
      expect(encounter.party.DmgPerRound).to eq(2.875)
    end
  end

  describe "simulation" do
    it "tests if simulation reduces HP pool to zero" do
      enemy = create(:enemy)
      creaturetype = create(:creaturetype, name: "Goblin", DEX: 14, AC: 15)
      creaturetype.attacks.push(create(:attack, ability_mod: "DEX", dmg: 3.5))
      enemy.creatures.push(create(:creature, creaturetype: creaturetype))
      creaturetype = create(:creaturetype, name: "Imp")
      creaturetype.attacks.push(create(:attack))
      enemy.creatures.push(create(:creature, creaturetype: creaturetype))

      party = create(:party)
      fighter = create(:player, name: "Fighter", DEX: 16, AC: 18)
      fighter.attackplayers.push(create(:attackplayer, ability_mod: "DEX", dmg: 4.5))
      party.players.push(fighter)

      encounter = create(:encounter)
      encounter.party = party
      encounter.enemy = enemy

      encounter.simulate
      expect(enemy.HPpool).to eq(0)
    end
  end
end
