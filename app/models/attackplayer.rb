class Attackplayer < ApplicationRecord
    validates :ability_mod, presence: true
    validates :dmg, presence: true
    validates :name, presence: true
end
