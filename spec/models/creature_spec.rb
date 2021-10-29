require 'rails_helper'

RSpec.describe Creature, type: :model do
  describe "calculations" do
    it "tests if attack bonus is calculated" do
      creaturetype = create(:creaturetype)
      creaturetype.attacks.push(create(:attack))
      creature = create(:creature, creaturetype: creaturetype)
      expect(creature.cal_attack_bonus).to eq(2)
    end

    it "tests if attack damage is calculated" do
      creaturetype = create(:creaturetype, STR: 16)
      creaturetype.attacks.push(create(:attack))
      creature = create(:creature, creaturetype: creaturetype)

      expect(creature.cal_attack_dmg).to eq(5.5)
    end

    it "tests if attack can include and exclude adding ab_mod to dmg" do
      creaturetype = create(:creaturetype, name: "Goblin", STR: 16)
      creaturetype.attacks.push(create(:attack))
      goblin = create(:creature, creaturetype: creaturetype)

      creaturetype = create(:creaturetype, name: "Imp", STR: 16)
      creaturetype.attacks.push(create(:attack, ability_modifier_dmg: false))
      imp = create(:creature, creaturetype: creaturetype)

      expect(goblin.cal_attack_dmg).to eq(5.5)
      expect(imp.cal_attack_dmg).to eq(2.5)
    end
  end
end
