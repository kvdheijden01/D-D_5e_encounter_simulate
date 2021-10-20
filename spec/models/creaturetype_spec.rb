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
      expect(goblin).to be_valid
    end
  end
end
