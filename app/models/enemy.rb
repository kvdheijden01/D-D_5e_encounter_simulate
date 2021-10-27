class Enemy < ApplicationRecord
  has_many :creatures

  def cal_HPpool
    creatures.each do |creature|
      self.HPpool += creature.creaturetype.HP
    end
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

  def cal_acc_mod
    ((cal_avr_ab + 10.5) - cal_avr_ac) * 0.05 + 0.5
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

  def cal_dmg_per_round
    cal_acc_mod * cal_avr_dmg
  end
end
