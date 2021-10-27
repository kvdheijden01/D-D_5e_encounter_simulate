require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "validation tests" do
    let(:player) { build(:player) }

    it "tests factory is valid" do
      player = build(:player)
      expect(player).to be_valid  
    end

    it "tests name has to be unique" do
      player1 = create(:player, name: "Fighter")
      player2 = build(:player, name: player1.name)
      player3 = build(:player, name: "Wizard")
      expect(player1).to be_valid
      expect(player2).not_to be_valid
      expect(player3).to be_valid
    end

    it "tests if player has HP" do
      fighter = create(:player, name: "Fighter", HP: 7)
      expect(fighter.HP).to eq(7)
    end

    it "tests if player has AC" do
      fighter = create(:player, name: "Fighter", AC: 15)
      expect(fighter.AC).to eq(15)
    end

    it "tests if player has proficiency" do
      fighter = create(:player, name: "Fighter", proficiency: 2)
      expect(fighter.proficiency).to eq(2)
    end

    it "tests if player has ability scores" do
      fighter = create(:player, name: "Fighter", STR: 10, DEX: 10, CON: 10, INT: 10, WIS: 10, CHA: 10)
      expect(fighter.STR).to eq(10)
      expect(fighter.DEX).to eq(10)
      expect(fighter.CON).to eq(10)
      expect(fighter.INT).to eq(10)
      expect(fighter.WIS).to eq(10)
      expect(fighter.CHA).to eq(10)

    end

  end

  describe "calculations" do
    it "tests if attack bonus is calculated" do
      player = create(:player)
      player.attackplayers.push(create(:attackplayer))
      expect(player.cal_attack_bonus).to eq(2)
    end

    it "tests if attack damage is calculated" do
      player = create(:player, STR: 16)
      player.attackplayers.push(create(:attackplayer))

      expect(player.cal_attack_dmg).to eq(5.5)
    end
  end
end
