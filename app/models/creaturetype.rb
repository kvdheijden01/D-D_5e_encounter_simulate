class Creaturetype < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :HP, presence: true
  validates :ac, presence: true
  validates :proficiency, presence: true
  validates :STR, presence: true
  validates :DEX, presence: true
  validates :CON, presence: true
  validates :INT, presence: true
  validates :WIS, presence: true
  validates :CHA, presence: true

  has_many :attacks

  def ac
    @ac
  end

  def ac=(ac)
    @ac = ac
  end
end
