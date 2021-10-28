class Attack < ApplicationRecord
    validates :ability_mod, presence: true
    validates :dmg, presence: true
    validates :name, presence: true

    def is_ab_true
        ability_modifier_dmg
    end
end
