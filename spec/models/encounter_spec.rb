require 'rails_helper'

RSpec.describe Encounter, type: :model do
  describe "validation" do
    it "model relations can retrieve creature name" do
      creature = create(:creature)
      enemy = create(:enemy)
      encounter = create(:encounter)
      enemy.creatures.push(creature)
      encounter.enemy = enemy
      expect(encounter.enemy.creatures.first.name).to eq(creature.name)
    end

  end
end
