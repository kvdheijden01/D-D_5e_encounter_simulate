class Encounter < ApplicationRecord
    has_one :enemy
    has_one :party
end
