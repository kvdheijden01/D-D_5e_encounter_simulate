class Creaturetype < ApplicationRecord
    validates :name, presence: true , uniqueness: true
    validates :HP, presence: true
    validates :AC, presence: true
    validates :proficiency, presence: true

    has_many :attacks
    
end
