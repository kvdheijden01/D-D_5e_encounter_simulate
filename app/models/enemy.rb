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
end
