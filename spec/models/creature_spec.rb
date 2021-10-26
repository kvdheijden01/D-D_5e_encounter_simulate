require 'rails_helper'

RSpec.describe Creature, type: :model do
  describe "calculations" do
    it "tests if attack bonus is calculated" do
      creaturetype = create(:creaturetype)
      creaturetype.attacks.push(create(:attack))
      creature = create(:creature, creaturetype: creaturetype)
      expect(creature.cal_attack_bonus).to eq(2)
    end
  end
end
