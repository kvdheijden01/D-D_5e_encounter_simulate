require 'rails_helper'

RSpec.describe Creature, type: :model do
  describe "validation tests" do
    let(:creature) { build(:creature) }

    it "factory is valid" do
      creature = build(:creature)
      expect(creature).to be_valid  
    end

    it "name has to be unique" do
      creature1 = create(:creature, name: "Goblin")
      creature2 = build(:creature, name: creature1.name)
      creature3 = build(:creature, name: "Imp")
      expect(creature1).to be_valid
      expect(creature2).not_to be_valid
      expect(creature3).to be_valid
    end
  end
end
