require 'rails_helper'

RSpec.describe Attackplayer, type: :model do
  describe "validation" do
    it "tests factory is valid" do
      attackplayer = build(:attackplayer)
      expect(attackplayer).to be_valid  
    end
  end

  describe "instances" do
    it "tests if attackplayer has an ability_mod" do
      attackplayer = build(:attackplayer)
      expect(attackplayer.ability_mod).to eq("STR")
    end

    it "tests if attackplayer has a name" do
      attackplayer = build(:attackplayer)
      expect(attackplayer.name).to eq("Fist")
    end

    it "tests if attackplayer has a dmg value" do
      attackplayer = build(:attackplayer)
      expect(attackplayer.dmg).to eq(0)
    end

  end
end
