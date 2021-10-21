require 'rails_helper'

RSpec.describe Creaturetype, type: :model do
  describe "validation tests" do
    let(:creaturetype) { build(:creaturetype) }

    it "tests factory is valid" do
      creaturetype = build(:creaturetype)
      expect(creaturetype).to be_valid  
    end

    it "tests name has to be unique" do
      creaturetype1 = create(:creaturetype, name: "Goblin")
      creaturetype2 = build(:creaturetype, name: creaturetype1.name)
      creaturetype3 = build(:creaturetype, name: "Imp")
      expect(creaturetype1).to be_valid
      expect(creaturetype2).not_to be_valid
      expect(creaturetype3).to be_valid
    end

    it "tests if creaturetype has HP" do
      goblin = create(:creaturetype, name: "Goblin", HP: 7)
      expect(goblin.HP).to eq(7)
    end

    it "tests if creaturetype has AC" do
      goblin = create(:creaturetype, name: "Goblin", AC: 15)
      expect(goblin.AC).to eq(15)
    end

    it "tests if creaturetype has proficiency" do
      goblin = create(:creaturetype, name: "Goblin", proficiency: 2)
      expect(goblin.proficiency).to eq(2)
    end

    it "tests if creaturetype has ability scores" do
      goblin = create(:creaturetype, name: "Goblin", STR: 10, DEX: 10, CON: 10, INT: 10, WIS: 10, CHA: 10)
      expect(goblin.STR).to eq(10)
      expect(goblin.DEX).to eq(10)
      expect(goblin.CON).to eq(10)
      expect(goblin.INT).to eq(10)
      expect(goblin.WIS).to eq(10)
      expect(goblin.CHA).to eq(10)

    end

  end
end
