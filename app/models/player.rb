class Player < ApplicationRecord
    validates :name, presence: true , uniqueness: true
    validates :HP, presence: true
    validates :AC, presence: true
    validates :proficiency, presence: true
    validates :STR, presence: true
    validates :DEX, presence: true
    validates :CON, presence: true
    validates :INT, presence: true
    validates :WIS, presence: true
    validates :CHA, presence: true
end
