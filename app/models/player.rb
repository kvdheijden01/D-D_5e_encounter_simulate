class Player < ApplicationRecord
    validates :name, presence: true , uniqueness: true
    validates :HP, presence: true
    validates :AC, presence: true
    validates :proficiency, presence: true
    validates :STR, presence: true
    validates :DEX, presence: true
    validates :CON, presence: true
    validates :INT, presence: true
    validates :WIS, presence: true
    validates :CHA, presence: true

    has_many :attackplayers

    def cal_attack_bonus
        self.proficiency + self.cal_ab_mod(self.attackplayers.first.ability_mod)
    end

    def cal_attack_dmg
      attack = self.attackplayers.first
      if attack.ability_modifier_dmg
          return attack.dmg + self.cal_ab_mod(attack.ability_mod)
      else
          return attack.dmg
      end
    end

    def cal_ab_mod(ability_mod)
        abilityscore = nil
        if ability_mod == "STR"
          abilityscore = self.STR
        elsif ability_mod == "DEX"
          abilityscore = self.DEX
        elsif ability_mod == "CON"
          abilityscore = self.CON
        elsif ability_mod == "INT"
          abilityscore = self.INT
        elsif ability_mod == "WIS"
          abilityscore = self.WIS
        elsif ability_mod == "CHA"
          abilityscore = self.CHA
        end
        cal_modifier(abilityscore)
      end
    
      def cal_modifier(abilityscore)
        if abilityscore <= 1
          return -5
        elsif abilityscore > 1 and abilityscore <= 3
          return -4
        elsif abilityscore > 3 and abilityscore <= 5
          return -3
        elsif abilityscore > 5 and abilityscore <= 7
          return -2
        elsif abilityscore > 7 and abilityscore <= 9
          return -1
        elsif abilityscore > 9 and abilityscore <= 11
          return 0
        elsif abilityscore > 11 and abilityscore <= 13
          return 1
        elsif abilityscore > 13 and abilityscore <= 15
          return 2
        elsif abilityscore > 15 and abilityscore <= 17
          return 3
        elsif abilityscore > 17 and abilityscore <= 19
          return 4
        elsif abilityscore > 19 and abilityscore <= 21
          return 5
        elsif abilityscore > 21 and abilityscore <= 23
          return 6
        elsif abilityscore > 23 and abilityscore <= 25
          return 7
        elsif abilityscore > 25 and abilityscore <= 27
          return 8
        elsif abilityscore > 27 and abilityscore <= 29
          return 9
        elsif abilityscore > 29
          return 10
        end
        
      end
end
