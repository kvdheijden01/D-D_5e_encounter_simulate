class Creature < ApplicationRecord
    belongs_to :creaturetype

    def cal_attack_bonus
        attack = self.creaturetype.attacks.first
        self.creaturetype.proficiency + self.creaturetype.cal_ab_mod(attack.ability_mod)
    end

    def cal_attack_dmg
        attack = self.creaturetype.attacks.first
        if attack.ability_modifier_dmg
            return attack.dmg + self.creaturetype.cal_ab_mod(attack.ability_mod)
        else
            return attack.dmg
        end
    end
end
