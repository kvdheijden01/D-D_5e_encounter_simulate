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

    def simulate
        self.initiate_simulation
        while enemy.HPpool > 0 and party.HPpool > 0
            enemy.HPpool = [enemy.HPpool - party.DmgPerRound, 0].max
            party.HPpool = [party.HPpool - enemy.DmgPerRound, 0].max
        end

    end

    def initiate_simulation
        self.enemy.cal_HPpool
        self.party.cal_HPpool
        self.cal_dmg_per_round
    end

    def verdict
        start_enemy_hp = self.enemy.cal_HPpool_number
        start_party_hp = self.party.cal_HPpool_number

        if party.HPpool == 0 and enemy.HPpool > 0.25*start_enemy_hp
            return "Defeat! This encounter is close to imposible."
        elsif party.HPpool == 0 and enemy.HPpool <= 0.25*start_enemy_hp
            return "Defeat! This encounter is Deadly"
        elsif party.HPpool <= 0.25*start_party_hp and enemy.HPpool == 0
            return "Victory! This encounter is Hard"
        elsif party.HPpool > 0.25*start_party_hp and party.HPpool <= 0.5*start_party_hp and enemy.HPpool == 0
            return "Victory! This encounter is Medium"
        elsif party.HPpool > 0.5*start_party_hp and party.HPpool <= 0.75*start_party_hp and enemy.HPpool == 0
            return "Victory! This encounter is Easy"
        elsif party.HPpool > 0.75*start_party_hp and enemy.HPpool == 0
            return "Victory! This encounter is Trivial"
        end
    end
end
