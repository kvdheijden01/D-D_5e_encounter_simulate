class Enemy < ApplicationRecord
  has_many :creatures

  def cal_HPpool
    creatures.each do |creature|
      puts self.HPpool
      puts creature.creaturetype.HP
      self.HPpool = self.HPpool + creature.creaturetype.HP
      puts self.HPpool
    end
  end
end
