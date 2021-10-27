require 'rails_helper'

RSpec.describe Party, type: :model do
  describe "validation" do
    it "enemy - player model relations can retrieve name" do
      player = create(:player)
      party = create(:party)
      party.players.push(player)
      expect(party.players.first.name).to eq(player.name)
    end

  end

  describe 'calcualtions' do
    it 'tests if HPpool is calculated' do
      party = create(:party)
      party.players.push(create(:player, name: "Fighter"))
      party.players.push(create(:player, name: "Wizard"))
      
      expect(party.HPpool).to eq(0)
      party.cal_HPpool
      expect(party.HPpool).to eq(2)
    end

    it "tests if AvrAC is calculated" do
      party = create(:party)
      party.players.push(create(:player, name: "Fighter", AC: 15))
      party.players.push(create(:player, name: "Wizard"))

      expect(party.cal_avr_ac).to eq(12.5)
    end

    it "tests if avr_ab is calculated" do
      party = create(:party)
      fighter = create(:player, name: "Fighter", DEX: 16)
      fighter.attackplayers.push(create(:attackplayer, ability_mod: "DEX"))
      wizard = create(:player, name: "Wizard")
      wizard.attackplayers.push(create(:attackplayer))
      party.players.push(fighter)
      party.players.push(wizard)

      expect(party.cal_avr_ab).to eq(3.5)
    end


    it "tests if avr attack damage is calculated" do
      party = create(:party)
      fighter = create(:player, name: "Fighter", DEX: 16, AC: 15)
      fighter.attackplayers.push(create(:attackplayer, ability_mod: "DEX", dmg: 4.5))
      wizard = create(:player, name: "Wizard")
      wizard.attackplayers.push(create(:attackplayer))
      party.players.push(fighter)
      party.players.push(wizard)

      expect(party.cal_avr_dmg).to eq(5.0)
    end

  end
end
