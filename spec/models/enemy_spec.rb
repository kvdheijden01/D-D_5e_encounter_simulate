# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Enemy, type: :model do
  describe 'validation' do
    it 'enemy - creature model relations can retrieve name' do
      creaturetype = create(:creaturetype)
      creature = create(:creature, creaturetype: creaturetype)
      enemy = create(:enemy)
      enemy.creatures.push(creature)
      expect(enemy.creatures.first.creaturetype.name).to eq(creaturetype.name)
    end

  end

  describe 'calcualtions' do
    it 'tests if HPpool is calculated' do
      enemy = enemy_setup('Goblin', 'Imp')
      expect(enemy.HPpool).to eq(0)
      enemy.cal_HPpool
      expect(enemy.HPpool).to eq(2)
    end

    it "tests if AvrAC is calculated" do
      enemy = create(:enemy)
      creaturetype = create(:creaturetype, name: "Goblin", AC: 15)
      enemy.creatures.push(create(:creature, creaturetype: creaturetype))

      creaturetype = create(:creaturetype, name: "Imp")
      enemy.creatures.push(create(:creature, creaturetype: creaturetype))

      expect(enemy.creatures.first.creaturetype.AC).to eq(15)
      expect(enemy.cal_avr_ac).to eq(12.5)
    end

  end

  def enemy_setup(*names)
    enemy = create(:enemy)
    names.each do |name|
      creaturetype = create(:creaturetype, name: name)
      enemy.creatures.push(create(:creature, creaturetype: creaturetype))
    end
    enemy
  end

end
