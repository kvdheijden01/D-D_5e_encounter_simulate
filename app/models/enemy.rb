class Enemy < ApplicationRecord
  has_many :creatures

  def cal_HPpool
    hp_pool = 0
    creatures.each do |creature|
      hp_pool += creature.creaturetype.HP
    end
    self.HPpool = hp_pool
  end

  def cal_avr_ac
    numerator = 0
    denominator = 0
    creatures.each do |creature|
      numerator += creature.creaturetype.AC
      denominator += 1
    end
    numerator.to_f / denominator.to_f
  end

  def cal_avr_ab
    numerator = 0
    denominator = 0
    creatures.each do |creature|
      numerator += creature.cal_attack_bonus
      denominator += 1
    end
    numerator.to_f / denominator.to_f
  end

  def cal_avr_dmg
    numerator = 0
    denominator = 0
    creatures.each do |creature|
      numerator += creature.cal_attack_dmg
      denominator += 1
    end
    numerator.to_f / denominator.to_f
  end
end
