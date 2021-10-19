class Creaturetype < ApplicationRecord
    validates :name, presence: true , uniqueness: true
    
end
