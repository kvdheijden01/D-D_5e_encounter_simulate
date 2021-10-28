require 'rails_helper'

RSpec.describe Attack, type: :model do
  describe "validation" do
    it "tests factory is valid" do
      attack = build(:attack)
      expect(attack).to be_valid  
    end
  end

  describe "instances" do
    it "tests if attack has an ability_mod" do
      attack = build(:attack)
      expect(attack.ability_mod).to eq("STR")
    end

    it "tests if attack has a name" do
      attack = build(:attack)
      expect(attack.name).to eq("Fist")
    end

    it "tests if attack has a dmg value" do
      attack = build(:attack)
      expect(attack.dmg).to eq(2.5)
    end

  end
end
