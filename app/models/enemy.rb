class Enemy < ApplicationRecord
  has_many :creatures

  def cal_HPpool
    creatures.each do |creature|
      self.HP_pool += creature.creaturetype.HP
    end
  end

  def cal_avr_ac
    numerator = 0
    denominator = 0
    creatures.each do |creature|
      numerator += creature.creaturetype.AC
      denominator += 1
    end
    numerator / denominator
  end
end
