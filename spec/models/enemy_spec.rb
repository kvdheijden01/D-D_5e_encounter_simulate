require 'rails_helper'

RSpec.describe Enemy, type: :model do
  describe "validation" do
    it "enemy - creature model relations can retrieve name" do
      creaturetype = create(:creaturetype)
      creature = create(:creature, creaturetype: creaturetype)
      enemy = create(:enemy)
      enemy.creatures.push(creature)
      expect(enemy.creatures.first.creaturetype.name).to eq(creaturetype.name)
    end

  end

end
