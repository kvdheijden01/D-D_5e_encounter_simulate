class Encounter < ApplicationRecord
    has_one :enemy
    has_one :party

    def cal_acc_mod_enemy
        ((enemy.cal_avr_ab + 10.5) - party.cal_avr_ac) * 0.05 + 0.5
    end

    def cal_acc_mod_party
        ((party.cal_avr_ab + 10.5) - enemy.cal_avr_ac) * 0.05 + 0.5
    end

    def cal_dmg_per_round
        enemy.DmgPerRound = cal_acc_mod_enemy * enemy.cal_avr_dmg
        party.DmgPerRound = cal_acc_mod_party * party.cal_avr_dmg
    end
end
