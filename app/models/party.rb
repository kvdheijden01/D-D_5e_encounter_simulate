class Party < ApplicationRecord
    has_many :players

    def cal_HPpool
      hp_pool = 0
      players.each do |player|
        hp_pool += player.HP
      end
      self.HPpool = hp_pool.to_f
    end

    def cal_HPpool_number
      hp_pool = 0
      players.each do |player|
        hp_pool += player.HP
      end
      return hp_pool
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
    
      def cal_avr_dmg
        numerator = 0
        denominator = 0
        players.each do |player|
          numerator += player.cal_attack_dmg
          denominator += 1
        end
        numerator.to_f / denominator.to_f
      end
end
