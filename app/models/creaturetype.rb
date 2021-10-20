class Creaturetype < ApplicationRecord
    validates :name, presence: true , uniqueness: true
    validates :HP, presence: true
    
end
