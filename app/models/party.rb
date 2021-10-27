class Party < ApplicationRecord
    has_many :players

    def cal_HPpool
        players.each do |player|
          self.HPpool += player.HP
        end
      end
    
      def cal_avr_ac
        numerator = 0
        denominator = 0
        players.each do |player|
          numerator += player.AC
          denominator += 1
        end
        numerator.to_f / denominator.to_f
      end
    
      def cal_avr_ab
        numerator = 0
        denominator = 0
        self.players.each do |player|
          numerator += player.cal_attack_bonus
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
        players.each do |player|
          numerator += player.cal_attack_dmg
          denominator += 1
        end
        numerator.to_f / denominator.to_f
      end
    
      def cal_dmg_per_round
        cal_acc_mod * cal_avr_dmg
      end
end
