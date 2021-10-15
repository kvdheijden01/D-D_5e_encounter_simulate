class Creature < ApplicationRecord
    validates :name, presence: true , uniqueness: true
end
